// File: models/game_event.dart

import 'package:celest_backend/data/database.dart';

abstract class GameEvent {}

class GameUpdatedEvent extends GameEvent {
  final Game game;

  GameUpdatedEvent(this.game);

  @override
  toString() => 'GameUpdatedEvent(game: ${game.toJson()})';
}

class PlayerUpdatedEvent extends GameEvent {
  final Player player;

  PlayerUpdatedEvent(this.player);

  @override
  toString() => 'PlayerUpdatedEvent(player: ${player.toJson()})';
}

class QuestionUpdatedEvent extends GameEvent {
  final Question question;

  QuestionUpdatedEvent(this.question);

  @override
  toString() => 'QuestionUpdatedEvent(question: ${question.toJson()})';
}

class AnswerSubmittedEvent extends GameEvent {
  final Answer answer;

  AnswerSubmittedEvent(this.answer);

  @override
  toString() => 'AnswerSubmittedEvent(answer: ${answer.toJson()})';
}