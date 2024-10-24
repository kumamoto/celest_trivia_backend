// File: database_event_manager.dart

import 'dart:async';
import 'dart:convert';

import 'package:celest_backend/data/database.dart';
import 'package:celest_backend/src/generated/cloud.celest.dart';
import 'package:crypto/crypto.dart' show sha256;
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _log = Logger('DatabaseEventManager');

class DatabaseEvent {
  final String tableName;
  final String roomCode;
  final Map<String, dynamic> data;

  DatabaseEvent(this.tableName, this.roomCode, this.data);
}

class DatabaseEventManager {
  late final AppDatabase _db;
  final _eventController = StreamController<DatabaseEvent>.broadcast();
  final Map<String, StreamSubscription> _tableSubscriptions = {};
  final Map<String, StreamSubscription> _tableListenSubscriptions = {};
  final Map<String, String> _rowHashes = {};

  DatabaseEventManager() {
    _db = GetIt.instance<AppDatabase>();
    _initializeListeners();
  }

  void _initializeListeners() {
    _startTableListener('games', _db.games);
    _startTableListener('players', _db.players);
    _startTableListener('questions', _db.questions);
    _startTableListener('answers', _db.answers);
  }

  void _startTableListener(String tableName, TableInfo table) {
    _log.info('Listening to table $tableName');
    listenToTable(tableName, (data) {
      print("tableEvent: $tableName $data");

      // select all rows for this table
      table.select().get().then(
        (rows) {
          for (var row in rows) {
            var itemData = row.toJson();
            var currentHash =
                sha256.convert(utf8.encode(json.encode(itemData))).toString();

            if (_rowHashes["$tableName:${itemData['id']}"] != currentHash) {
              print("this item has changed: $tableName $itemData");
              _rowHashes["$tableName:${itemData['id']}"] = currentHash;

              if (itemData['roomCode'] != null) {
                _eventController.add(
                    DatabaseEvent(tableName, itemData['roomCode'], itemData));
              } else {
                if (tableName == 'answers') {
                  // we are in the answers table and we need to find the room code
                  // in the games table
                  final gameId = itemData['game'] as int?;
                  if (gameId != null) {
                    (_db.select(_db.games)..where((g) => g.id.equals(gameId)))
                        .getSingleOrNull()
                        .then(
                      (game) {
                        if (game != null) {
                          _eventController.add(DatabaseEvent(
                              tableName, game.roomCode, itemData));
                        }
                      },
                    );
                  }
                }
              }
            }
          }
        },
      );
    }).then(
      (value) {
        if (value != null) {
          value.onDone(() {
            _log.info('Listener for $tableName closed, restarting');
            _startTableListener(tableName, table);
          });
          value.onError((e) {
            _log.severe('Error in $tableName listener, restarting', e);
            _startTableListener(tableName, table);
          });
          _tableListenSubscriptions[tableName] = value;
        }
      },
    );
  }

  Future<StreamSubscription<String>?> listenToTable(
      String tableName, Function(String) onData) async {
    var tursoDBUrl = celest.variables.tursoDbUrl
        .replaceAll("ws://", "https://");
    var tursoToken = celest.variables.tursoDbJwtToken;

    String libsqlUrl = "$tursoDBUrl/beta/listen?table=$tableName";
    final url = Uri.parse(libsqlUrl);
    final request = http.Request('GET', url)
      ..headers['Authorization'] = 'Bearer $tursoToken';

    return request.send().then((streamedResponse) {
      if (streamedResponse.statusCode == 200) {
        return streamedResponse.stream
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .listen((data) {
          if (data.trim().isNotEmpty && data.startsWith("data:")) {
            _log.info('Received update for $tableName: $data');
            onData(data);
          }
        }, onError: (error) {
          _log.severe('Error in $tableName listener: $error');
        }, onDone: () {
          _log.info('$tableName connection closed.');
        });
      } else {
        _log.warning(
            'Failed to connect to $tableName endpoint: ${streamedResponse.statusCode}');
        return null;
      }
    });
  }

  Stream<DatabaseEvent> listenToRoom(String roomCode) {
    return _eventController.stream.where((event) => event.roomCode == roomCode);
  }

  Future<void> dispose() async {
    for (final subscription in _tableSubscriptions.values) {
      await subscription.cancel();
    }
    for (final subscription in _tableListenSubscriptions.values) {
      await subscription.cancel();
    }
    await _eventController.close();
  }
}
