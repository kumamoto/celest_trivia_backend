import 'dart:async';

import 'package:celest_backend/data/database.dart';
import 'package:celest_backend/data/database_event_manager.dart';
import 'package:celest_backend/events.dart';
import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:drift/drift.dart' as drift;
import 'package:logging/logging.dart';

final _log = Logger('TriviaGameState');

class TriviaGameState {
  final String roomCode;
  late final StreamSubscription<DatabaseEvent> _eventSubscription;
  final _gameStateController = StreamController<GameEvent>.broadcast();

  Game? _currentGame;
  final List<Player> _players = [];
  final List<Question> _questions = [];

  TriviaGameState(this.roomCode) {
    _initializeEventSubscription();
  }

  void _initializeEventSubscription() {
    _eventSubscription = CelestData.eventManager
        .listenToRoom(roomCode)
        .listen(_handleDatabaseEvent, onError: _handleDatabaseError);
  }

  Stream<GameEvent> get stream => _gameStateController.stream;

  void _handleDatabaseEvent(DatabaseEvent event) {
    print("DatabaseEvent: $event");

    switch (event.tableName) {
      case 'games':
        _handleGameEvent(event.data);
        break;
      case 'players':
        _handlePlayerEvent(event.data);
        break;
      case 'questions':
        _handleQuestionEvent(event.data);
        break;
      case 'answers':
        _handleAnswerEvent(event.data);
        break;
      default:
        _log.warning('Unexpected event type: ${event.tableName}');
    }
  }

  void _handleDatabaseError(error) {
    _log.severe('Error in database event stream', error);
    _gameStateController.addError(error);
  }

  void _handleGameEvent(Map<String, dynamic> data) {
    _currentGame = Game.fromJson(data);
    _gameStateController.add(GameUpdatedEvent(_currentGame!));
  }

  void _handlePlayerEvent(Map<String, dynamic> data) {
    final player = Player.fromJson(data);
    final existingIndex = _players.indexWhere((p) => p.id == player.id);
    if (existingIndex != -1) {
      _players[existingIndex] = player;
    } else {
      _players.add(player);
    }
    _gameStateController.add(PlayerUpdatedEvent(player));
  }

  void _handleQuestionEvent(Map<String, dynamic> data) {
    final question = Question.fromJson(data);
    final existingIndex = _questions.indexWhere((q) => q.id == question.id);
    if (existingIndex != -1) {
      _questions[existingIndex] = question;
    } else {
      _questions.add(question);
    }
  }

  void _handleAnswerEvent(Map<String, dynamic> data) {
    final answer = Answer.fromJson(data);
    _gameStateController.add(AnswerSubmittedEvent(answer));
  }

  Future<void> startGame() async {
    try {
      await (CelestData.db.update(CelestData.db.games)
            ..where((g) => g.roomCode.equals(roomCode)))
          .write(GamesCompanion(
        isGameStarted: drift.Value(true),
        currentQuestionIndex: drift.Value(0),
      ));

      _log.info('Game started: $roomCode');
    } catch (e) {
      _log.severe('Failed to start game: $roomCode', e);
      rethrow;
    }
  }

  Future<void> addPlayer(String name) async {
    if (name.trim().isEmpty) {
      throw BadNameException('Player name cannot be empty');
    }
    if (_players.any((p) => p.name == name)) {
      throw BadNameException('Player name already exists');
    }

    try {
      await CelestData.db.players.insert().insert(
            PlayersCompanion.insert(
              name: name,
              score: 0,
              hasAnswered: false,
              roomCode: roomCode,
              lastPing: DateTime.now().millisecondsSinceEpoch,
            ),
          );
      _log.info('Player added: $name to room: $roomCode');
    } catch (e) {
      _log.severe('Failed to add player: $name to room: $roomCode', e);
      rethrow;
    }
  }

  Future<void> submitAnswer(
      String playerName, int questionId, int answerIndex, int bonus) async {
    final player = _players.firstWhere((p) => p.name == playerName);

    try {
      var db = CelestData.db;

      final question = await (db.select(db.questions)
            ..where((q) => q.roomCode.equals(roomCode))
            ..where((q) => q.id.equals(questionId)))
          .getSingleOrNull();

      // check if player has already answered by checking if there is an answer row with the same question and player
      final answer = await (db.select(db.answers)
            ..where((a) => a.question.equals(questionId))
            ..where((a) => a.player.equals(player.id))
            ..where((a) => a.game.equals(_currentGame!.id)))
          .getSingleOrNull();

      if (answer != null) {
        throw Exception('Player has already answered');
      }

      await CelestData.db.answers.insert().insert(
            AnswersCompanion.insert(
              question: questionId,
              answerIndex: answerIndex,
              player: player.id,
              game: _currentGame!.id,
            ),
          );

      if (answerIndex == question?.correctOptionIndex) {

        // divide bonus by 1000 and round up to an integer
        bonus = (bonus / 1000).floor().toInt();

        await _updatePlayerScore(player.id, player.score + 1 + bonus);
      }

      _log.info(
          'Answer submitted: Player ${player.id}, Question $questionId, Answer $answerIndex');
    } catch (e) {
      _log.severe(
          'Failed to submit answer: Player ${player.id}, Question $questionId',
          e);
      rethrow;
    }
  }

  Future<void> _updatePlayerScore(int playerId, int newScore) async {
    try {
      var db = CelestData.db;
      await (db.update(db.players)..where((p) => p.id.equals(playerId))).write(
        PlayersCompanion(
          score: drift.Value(newScore),
        ),
      );
      _log.info('Player score updated: Player $playerId, New score $newScore');
    } catch (e) {
      _log.severe('Failed to update player score: Player $playerId', e);
      rethrow;
    }
  }

  Future<void> nextQuestion() async {
    if (_currentGame == null) {
      throw StateError('Game has not been initialized');
    }
    if (!_currentGame!.isGameStarted) {
      throw StateError('Game has not started');
    }

    try {
      var db = CelestData.db;
      final nextIndex = _currentGame!.currentQuestionIndex + 1;
      await (db.update(db.games)
            ..where((g) => g.roomCode.equals(roomCode)))
          .write(GamesCompanion(
            currentQuestionIndex: drift.Value(nextIndex),
          ));

      _log.info('Advanced to next question: $nextIndex, Room: $roomCode');
    } catch (e) {
      _log.severe('Failed to advance to next question: Room: $roomCode', e);
      rethrow;
    }
  }

  Future<void> endGame() async {
    if (_currentGame == null) {
      throw StateError('Game has not been initialized');
    }
    if (!_currentGame!.isGameStarted) {
      throw StateError('Game has not started');
    }

    try {
      var db = CelestData.db;
        await (db.update(db.games)
          ..where((g) => g.roomCode.equals(roomCode)))
            .write(GamesCompanion(
          isGameOver: drift.Value(true),
        ));

      _log.info('Game ended: $roomCode');
    } catch (e) {
      _log.severe('Failed to end game: $roomCode', e);
      rethrow;
    }
  }

  Future<void> dispose() async {
    await _eventSubscription.cancel();
    await _gameStateController.close();
    _log.info('TriviaGameState disposed: $roomCode');
  }
}
