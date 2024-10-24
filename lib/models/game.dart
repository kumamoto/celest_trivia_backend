class GameDTO {
  String roomCode;
  List<PlayerDTO> players;
  QuestionDTO? currentQuestion;
  bool isGameStarted;
  bool isGameOver;
  List<String> playersWhoAnswered;

  GameDTO({
    required this.roomCode,
    required this.players,
    required this.currentQuestion,
    required this.isGameStarted,
    required this.isGameOver,
    this.playersWhoAnswered = const [],
  });

  @override
  String toString() => 'GameDTO(roomCode: $roomCode, players: $players, currentQuestion: $currentQuestion, isGameStarted: $isGameStarted, isGameOver: $isGameOver, playerWhoAnswered: $playersWhoAnswered)';
}

class QuestionDTO {
  int id;
  String content;
  List<String> options;
  int correctOptionIndex;
  bool isLastQuestion;

  QuestionDTO({
    required this.id,
    required this.content,
    required this.options,
    required this.correctOptionIndex,
    this.isLastQuestion = false,
  });

  @override
  String toString() => 'QuestionDTO(id: $id, content: $content, options: $options, correctOptionIndex: $correctOptionIndex, isLastQuestion: $isLastQuestion)';
}

class PlayerDTO {
  String name;
  int score;

  PlayerDTO({required this.name, required this.score});

  @override
  String toString() => 'PlayerDTO(name: $name, score: $score)';
}

