import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:celest/celest.dart';
import 'package:celest/http.dart';
import 'package:celest_backend/data/database.dart';
import 'package:celest_backend/events.dart';
import 'package:celest_backend/models/game.dart';
import 'package:celest_backend/models/game_event.dart';
import 'package:celest_backend/trivia_game_state.dart';
import 'package:crypto/crypto.dart' show sha256;
import 'package:drift/drift.dart';
import 'package:hrana/hrana.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

var db = CelestData.db;
Map<String, StreamSubscription<GameEvent>> _streamSubscriptions = {};
Map<String, StreamController<GameEventDTO>> roomStreams = {};
Map<String, String> roomStreamState = {};
Map<String, TriviaGameState> gameStates = {};

Future<T> executeWithRetry<T>(Future<T> Function() action) async {
  return await retry(
    action,
    retryIf: (e) => e is ConnectionClosed,
    onRetry: (e) async {
      print('Retrying');
      await CelestData.reinitialize();
    },
    maxAttempts: 3,
    maxDelay: Duration(seconds: 1),
  );
}

@cloud
Future<String?> getTrivia() async {
  final game = await (db.select(db.games)..limit(1)).getSingleOrNull();
  return game?.roomCode;
}

@cloud
Future<String> clearAll() async {
  return executeWithRetry(() async {
    await db.delete(db.games).go();
    await db.delete(db.players).go();
    await db.delete(db.questions).go();
    await db.delete(db.answers).go();
    return 'Cleared all data';
  });
}


@cloud
Future<Map<String, dynamic>> createRoom(
    String roomCode, int numQuestions, List<String> categories) async {
  return executeWithRetry(() async {
    // check if roomCode already exists
    final game = await (db.select(db.games)
          ..where((g) => g.roomCode.equals(roomCode))
          ..limit(1))
        .getSingleOrNull();

    if (game != null) {
      // get the questions
      var questions = await (db.select(db.questions)
            ..where((q) => q.roomCode.equals(roomCode)))
          .get();

      return {
        "roomCode": roomCode,
        "questions": questions,
      };
    }

    final questions = await _generateQuestions(numQuestions, categories);

    print('questions: $questions');

    await db.into(db.games).insert(GamesCompanion.insert(
          roomCode: roomCode,
          currentQuestionIndex: -1,
          isGameStarted: false,
          isGameOver: false,
        ));

    for (int i = 0; i < questions.length; i++) {
      await db.into(db.questions).insert(QuestionsCompanion.insert(
            roomCode: roomCode,
            questionIndex: i,
            content: questions[i]['content'],
            options: jsonEncode(questions[i]['options']),
            correctOptionIndex: questions[i]['correctOptionIndex'],
          ));
    }

    return {
      "roomCode": roomCode,
      "questions": questions,
    };
  });
}

@cloud
Future<int?> joinRoom(String roomCode, String playerName) async {
  return executeWithRetry(() async {
    final game = await (db.select(db.games)
          ..where((g) => g.roomCode.equals(roomCode)))
        .getSingleOrNull();

    if (game != null) {
      var player =
          await db.into(db.players).insertReturning(PlayersCompanion.insert(
                name: playerName,
                score: 0,
                hasAnswered: false,
                roomCode: roomCode,
                lastPing: DateTime.now().millisecondsSinceEpoch,
              ));
      return player.id;
    }
    return null;
  });
}

Future<List<Map<String, dynamic>>> _generateQuestions(
    int numQuestions, List<String> categories) async {
  try {
    String apiKey = Platform.environment['OPENAI_TOKEN'] ?? '';

    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a helpful assistant that generates trivia questions.'
          },
          {
            'role': 'user',
            'content': 'Generate $numQuestions trivia questions with 4 options each. '
                'Make the questions pretty difficult to guess and make the questions about the following topics ${categories.join(', ')}. '
                'Provide the correct answer index (0-3). Format the response as a JSON array of objects with "content", "options", and "correctOptionIndex" keys. '
                'Like the following JSON:\n\n[{"content": "What is the capital of France?", "options": ["London", "Berlin", "Paris", "Madrid"], "correctOptionIndex": 2}, {"content": "Which planet is known as the Red Planet?", "options": ["Mars", "Venus", "Jupiter", "Saturn"], "correctOptionIndex": 0}, {"content": "Who painted the Mona Lisa?", "options": ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"], "correctOptionIndex": 1}]'
          }
        ],
      }),
    );

    //print('response: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      var content = data['choices'][0]['message']['content'];

      content = content.replaceAll('```json\n', '');
      content = content.replaceAll('\n```', '');

      // print('content: $content');

      // Try to parse the content as JSON
      try {
        final questions = jsonDecode(content) as List;
        return questions.cast<Map<String, dynamic>>();
      } catch (e) {
        print('Failed to parse content as JSON: $e');
        // If parsing fails, try to extract questions manually
        return _extractQuestionsManually(content);
      }
    } else {
      throw Exception('Failed to generate questions: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    return [
      {
        "content": e.toString(),
        "options": ["I don't know what happened"],
        "correctOptionIndex": 0
      }
    ];
  }
}

List<Map<String, dynamic>> _extractQuestionsManually(String content) {
  final List<Map<String, dynamic>> questions = [];
  final RegExp questionRegex = RegExp(
      r'"content":\s*"([^"]*)".*?"options":\s*\[(.*?)\].*?"correctOptionIndex":\s*(\d)');

  final Iterable<RegExpMatch> matches = questionRegex.allMatches(content);

  for (final match in matches) {
    final String questionContent = match.group(1) ?? '';
    final String optionsString = match.group(2) ?? '';
    final int correctIndex = int.tryParse(match.group(3) ?? '') ?? 0;

    final List<String> options = optionsString
        .split(',')
        .map((option) => option.trim().replaceAll('"', ''))
        .toList();

    questions.add({
      "content": questionContent,
      "options": options,
      "correctOptionIndex": correctIndex,
    });
  }

  return questions;
}

@cloud
Future<void> answerQuestion(
    String roomCode, int questionId, int answerIndex, String playerName, int bonus) async {
  var gameState = gameStates[roomCode];
  if (gameState != null) {
    await gameState.submitAnswer(playerName, questionId, answerIndex, bonus);
  }
}

@cloud
Future<bool> startGame(String roomCode) async {
  var gameState = gameStates[roomCode];
  if (gameState != null) {
    await gameState.startGame();
    return true;
  }
  return false;
}

@cloud
Future<void> nextQuestion(String roomCode) async {

  var gameState = gameStates[roomCode];
  if (gameState != null) {
    await gameState.nextQuestion();
  }
}

@cloud
Future<void> finishGame(String roomCode) async {
  var gameState = gameStates[roomCode];
  if (gameState != null) {
    await gameState.endGame();
  }
}

@cloud
Stream<GameEventDTO> listenToGame({
  @httpQuery('roomCode') required String roomCode,
  @httpQuery('sseClientId') required String sseClientId,
}) {
  print('listenToGame: $roomCode');
  print('sseClientId: $sseClientId');

  var key = '$roomCode:$sseClientId';

  print('key: $key');

  if (roomStreams[key] != null) {
    roomStreamState.remove(key);
  }

  var roomStream = StreamController<GameEventDTO>.broadcast(sync: true);
  roomStreams[key] = roomStream;

  var gameState = gameStates[roomCode];
  if (gameState == null) {
    gameState = TriviaGameState(roomCode);
    gameStates[roomCode] = gameState;
  }

  _streamSubscriptions[roomCode] ??= gameState.stream.listen(
    (event) {
      print(event.toString());
      loadGame(roomCode).then((gameDTO) {
        roomStreams.keys
            .where(
          (element) => element.startsWith(roomCode),
        )
            .forEach(
          (key) {
            var eventClassName = event.runtimeType.toString();
            var roomStream = roomStreams[key];
            if (roomStream != null && !roomStream.isClosed) {
              wireGameData(key, roomStream, eventClassName, gameDTO);
            } else {
              print('roomStream $key is null or closed');
            }
          },
        );
      });
    },
  );
  return roomStream.stream;
}

void wireGameData(String key, StreamController<GameEventDTO> roomStream,
    String event, GameDTO gameDTO) {
  try {
    if (roomStream.isClosed) {
      throw Exception('Room stream is closed');
    }

    var gameEvent =
        GameEventDTO(tableName: 'games', content: event, game: gameDTO);

    print('key: $key');
    var stateHash =
        sha256.convert(utf8.encode(gameEvent.game.toString())).toString();
    print('stateHash: $stateHash');
    if (roomStreamState[key] == stateHash) {
      print('stateHash matches, not sending');
      return;
    }
    roomStreamState[key] = stateHash;

    if (!roomStream.isClosed) {
      print("sending gameEvent: $gameEvent");
      roomStream.add(gameEvent);
    }
  } catch (e) {
    print('Error: $e');
    roomStream.close();
    roomStreams.remove(key);
    _streamSubscriptions.remove(key);
  }
}

Future<GameDTO> loadGame(String roomCode) async {
  print('loadGame: $roomCode');

  return executeWithRetry(() async {
    final game = await (db.select(db.games)
          ..where((g) => g.roomCode.equals(roomCode))
          ..limit(1))
        .getSingleOrNull();

    if (game == null) {
      throw Exception('Game not found');
    }

    final question = await (db.select(db.questions)
          ..where((q) => q.roomCode.equals(roomCode))
          ..where((q) => q.questionIndex.equals(game.currentQuestionIndex)))
        .getSingleOrNull();

    final players =
        (await (db.select(db.players)..where((p) => p.roomCode.equals(roomCode))
                // ..where((p) => p.lastPing.isBiggerThanValue(lastPingLimit))
            ..orderBy([
              (p) => OrderingTerm(expression: p.score, mode: OrderingMode.desc)
            ])
                )
                .get())
            .toList();

    if (question == null) {
      return GameDTO(
        roomCode: roomCode,
        isGameOver: game.isGameOver,
        isGameStarted: game.isGameStarted,
        currentQuestion: null,
        players: players
            .map((p) => PlayerDTO(name: p.name, score: p.score))
            .toList(),
      );
    }

    // var lastPingLimit = DateTime.now()
    //     .subtract(const Duration(seconds: 30))
    //     .millisecondsSinceEpoch;

    final allQuestions = await (db.select(db.questions)
          ..where((q) => q.roomCode.equals(roomCode)))
        .get();

    // get players who answered
    final answers = await (db.select(db.answers)
          ..where((a) => a.question.equals(question.id))
          ..where((a) => a.game.equals(game.id)))
        .get();

    final playersWhoAnswered = players
        .where(
          (element) => answers.any(
            (a) => a.player == element.id,
          ),
        )
        .map((p) => p.name)
        .toList();

    print("playersWhoAnswered: $playersWhoAnswered");

    return GameDTO(
      roomCode: roomCode,
      isGameOver: game.isGameOver,
      isGameStarted: game.isGameStarted,
      playersWhoAnswered: playersWhoAnswered,
      currentQuestion: QuestionDTO(
          id: question.id,
          content: question.content,
          options: List<String>.from(jsonDecode(question.options)),
          correctOptionIndex: question.correctOptionIndex,
          isLastQuestion: game.currentQuestionIndex == allQuestions.length - 1),
      players:
          players.map((p) => PlayerDTO(name: p.name, score: p.score)).toList(),
    );
  });
}
