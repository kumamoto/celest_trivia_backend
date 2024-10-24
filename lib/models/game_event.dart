import 'package:celest_backend/models/game.dart';

class GameEventDTO {
  const GameEventDTO({required this.tableName, required this.content, this.game});
  final String tableName;
  final String content;
  final GameDTO? game;

  @override
  toString() => 'GameEvent(tableName: $tableName, content: $content, game: $game)';
}
