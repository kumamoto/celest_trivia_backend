import 'dart:async';
import 'package:celest_backend/data/database_event_manager.dart';
import 'package:celest_backend/src/generated/cloud.celest.dart';
import 'package:drift/drift.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:get_it/get_it.dart';

part 'database.g.dart';

class Games extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get roomCode => text()();

  IntColumn get currentQuestionIndex => integer()();

  BoolColumn get isGameStarted => boolean()();

  BoolColumn get isGameOver => boolean()();
}

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get score => integer()();

  BoolColumn get hasAnswered => boolean()();

  TextColumn get roomCode => text().references(Games, #roomCode)();

  IntColumn get lastPing => integer()();
}

class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get roomCode => text().references(Games, #roomCode)();

  IntColumn get questionIndex => integer()();

  TextColumn get content => text()();

  TextColumn get options => text()();

  IntColumn get correctOptionIndex => integer()();
}

class Answers extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get question => integer().references(Questions, #id)();

  IntColumn get answerIndex => integer()();

  IntColumn get player => integer().references(Players, #id)();

  IntColumn get game => integer().references(Games, #id)();
}

@DriftDatabase(tables: [Games, Players, Questions, Answers])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();
      }, onUpgrade: (m, from, to) async {
        await m.createAll();
      }, beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      });

  @override
  int get schemaVersion => 1;
}

class CelestData {
  static final GetIt _getIt = GetIt.instance;
  static bool _isInitialized = false;

  static Timer? _timer;


  static void _initializeServiceLocator() {
    if (!_isInitialized) {
      _timer ??= Timer.periodic(const Duration(minutes: 10), (timer) async {
        await reinitialize();
      });
      _getIt.registerLazySingleton<HranaDatabase>(() => HranaDatabase(
        Uri.parse(
            celest.variables.tursoDbUrl),
        jwtToken: celest.variables.tursoDbJwtToken,
      ),);
      _getIt.registerSingleton<AppDatabase>(_initializeDatabase());
      _getIt.registerSingleton<DatabaseEventManager>(DatabaseEventManager());
      _isInitialized = true;
    }
  }

  static AppDatabase _initializeDatabase() {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    return AppDatabase(_getIt<HranaDatabase>());
  }

  static AppDatabase get db {
    _initializeServiceLocator();
    return _getIt<AppDatabase>();
  }

  static DatabaseEventManager get eventManager {
    _initializeServiceLocator();
    return _getIt<DatabaseEventManager>();
  }

  static Future<void> reinitialize() async {
    print('Reinitializing CelestData...');
    if (_isInitialized) {
      _getIt.unregister<HranaDatabase>();
      _getIt.unregister<AppDatabase>();
      _getIt.unregister<DatabaseEventManager>();
      _isInitialized = false;
    }
    _initializeServiceLocator();
  }
}
