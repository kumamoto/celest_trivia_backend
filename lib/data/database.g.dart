// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomCodeMeta =
      const VerificationMeta('roomCode');
  @override
  late final GeneratedColumn<String> roomCode = GeneratedColumn<String>(
      'room_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentQuestionIndexMeta =
      const VerificationMeta('currentQuestionIndex');
  @override
  late final GeneratedColumn<int> currentQuestionIndex = GeneratedColumn<int>(
      'current_question_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isGameStartedMeta =
      const VerificationMeta('isGameStarted');
  @override
  late final GeneratedColumn<bool> isGameStarted = GeneratedColumn<bool>(
      'is_game_started', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_game_started" IN (0, 1))'));
  static const VerificationMeta _isGameOverMeta =
      const VerificationMeta('isGameOver');
  @override
  late final GeneratedColumn<bool> isGameOver = GeneratedColumn<bool>(
      'is_game_over', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_game_over" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomCode, currentQuestionIndex, isGameStarted, isGameOver];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_code')) {
      context.handle(_roomCodeMeta,
          roomCode.isAcceptableOrUnknown(data['room_code']!, _roomCodeMeta));
    } else if (isInserting) {
      context.missing(_roomCodeMeta);
    }
    if (data.containsKey('current_question_index')) {
      context.handle(
          _currentQuestionIndexMeta,
          currentQuestionIndex.isAcceptableOrUnknown(
              data['current_question_index']!, _currentQuestionIndexMeta));
    } else if (isInserting) {
      context.missing(_currentQuestionIndexMeta);
    }
    if (data.containsKey('is_game_started')) {
      context.handle(
          _isGameStartedMeta,
          isGameStarted.isAcceptableOrUnknown(
              data['is_game_started']!, _isGameStartedMeta));
    } else if (isInserting) {
      context.missing(_isGameStartedMeta);
    }
    if (data.containsKey('is_game_over')) {
      context.handle(
          _isGameOverMeta,
          isGameOver.isAcceptableOrUnknown(
              data['is_game_over']!, _isGameOverMeta));
    } else if (isInserting) {
      context.missing(_isGameOverMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_code'])!,
      currentQuestionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_question_index'])!,
      isGameStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_game_started'])!,
      isGameOver: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_game_over'])!,
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final int id;
  final String roomCode;
  final int currentQuestionIndex;
  final bool isGameStarted;
  final bool isGameOver;
  const Game(
      {required this.id,
      required this.roomCode,
      required this.currentQuestionIndex,
      required this.isGameStarted,
      required this.isGameOver});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_code'] = Variable<String>(roomCode);
    map['current_question_index'] = Variable<int>(currentQuestionIndex);
    map['is_game_started'] = Variable<bool>(isGameStarted);
    map['is_game_over'] = Variable<bool>(isGameOver);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      roomCode: Value(roomCode),
      currentQuestionIndex: Value(currentQuestionIndex),
      isGameStarted: Value(isGameStarted),
      isGameOver: Value(isGameOver),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      roomCode: serializer.fromJson<String>(json['roomCode']),
      currentQuestionIndex:
          serializer.fromJson<int>(json['currentQuestionIndex']),
      isGameStarted: serializer.fromJson<bool>(json['isGameStarted']),
      isGameOver: serializer.fromJson<bool>(json['isGameOver']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomCode': serializer.toJson<String>(roomCode),
      'currentQuestionIndex': serializer.toJson<int>(currentQuestionIndex),
      'isGameStarted': serializer.toJson<bool>(isGameStarted),
      'isGameOver': serializer.toJson<bool>(isGameOver),
    };
  }

  Game copyWith(
          {int? id,
          String? roomCode,
          int? currentQuestionIndex,
          bool? isGameStarted,
          bool? isGameOver}) =>
      Game(
        id: id ?? this.id,
        roomCode: roomCode ?? this.roomCode,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        isGameStarted: isGameStarted ?? this.isGameStarted,
        isGameOver: isGameOver ?? this.isGameOver,
      );
  Game copyWithCompanion(GamesCompanion data) {
    return Game(
      id: data.id.present ? data.id.value : this.id,
      roomCode: data.roomCode.present ? data.roomCode.value : this.roomCode,
      currentQuestionIndex: data.currentQuestionIndex.present
          ? data.currentQuestionIndex.value
          : this.currentQuestionIndex,
      isGameStarted: data.isGameStarted.present
          ? data.isGameStarted.value
          : this.isGameStarted,
      isGameOver:
          data.isGameOver.present ? data.isGameOver.value : this.isGameOver,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('roomCode: $roomCode, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('isGameStarted: $isGameStarted, ')
          ..write('isGameOver: $isGameOver')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, roomCode, currentQuestionIndex, isGameStarted, isGameOver);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.roomCode == this.roomCode &&
          other.currentQuestionIndex == this.currentQuestionIndex &&
          other.isGameStarted == this.isGameStarted &&
          other.isGameOver == this.isGameOver);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<String> roomCode;
  final Value<int> currentQuestionIndex;
  final Value<bool> isGameStarted;
  final Value<bool> isGameOver;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.roomCode = const Value.absent(),
    this.currentQuestionIndex = const Value.absent(),
    this.isGameStarted = const Value.absent(),
    this.isGameOver = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    required String roomCode,
    required int currentQuestionIndex,
    required bool isGameStarted,
    required bool isGameOver,
  })  : roomCode = Value(roomCode),
        currentQuestionIndex = Value(currentQuestionIndex),
        isGameStarted = Value(isGameStarted),
        isGameOver = Value(isGameOver);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<String>? roomCode,
    Expression<int>? currentQuestionIndex,
    Expression<bool>? isGameStarted,
    Expression<bool>? isGameOver,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomCode != null) 'room_code': roomCode,
      if (currentQuestionIndex != null)
        'current_question_index': currentQuestionIndex,
      if (isGameStarted != null) 'is_game_started': isGameStarted,
      if (isGameOver != null) 'is_game_over': isGameOver,
    });
  }

  GamesCompanion copyWith(
      {Value<int>? id,
      Value<String>? roomCode,
      Value<int>? currentQuestionIndex,
      Value<bool>? isGameStarted,
      Value<bool>? isGameOver}) {
    return GamesCompanion(
      id: id ?? this.id,
      roomCode: roomCode ?? this.roomCode,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isGameStarted: isGameStarted ?? this.isGameStarted,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomCode.present) {
      map['room_code'] = Variable<String>(roomCode.value);
    }
    if (currentQuestionIndex.present) {
      map['current_question_index'] = Variable<int>(currentQuestionIndex.value);
    }
    if (isGameStarted.present) {
      map['is_game_started'] = Variable<bool>(isGameStarted.value);
    }
    if (isGameOver.present) {
      map['is_game_over'] = Variable<bool>(isGameOver.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('roomCode: $roomCode, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('isGameStarted: $isGameStarted, ')
          ..write('isGameOver: $isGameOver')
          ..write(')'))
        .toString();
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hasAnsweredMeta =
      const VerificationMeta('hasAnswered');
  @override
  late final GeneratedColumn<bool> hasAnswered = GeneratedColumn<bool>(
      'has_answered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_answered" IN (0, 1))'));
  static const VerificationMeta _roomCodeMeta =
      const VerificationMeta('roomCode');
  @override
  late final GeneratedColumn<String> roomCode = GeneratedColumn<String>(
      'room_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES games (room_code)'));
  static const VerificationMeta _lastPingMeta =
      const VerificationMeta('lastPing');
  @override
  late final GeneratedColumn<int> lastPing = GeneratedColumn<int>(
      'last_ping', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, score, hasAnswered, roomCode, lastPing];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('has_answered')) {
      context.handle(
          _hasAnsweredMeta,
          hasAnswered.isAcceptableOrUnknown(
              data['has_answered']!, _hasAnsweredMeta));
    } else if (isInserting) {
      context.missing(_hasAnsweredMeta);
    }
    if (data.containsKey('room_code')) {
      context.handle(_roomCodeMeta,
          roomCode.isAcceptableOrUnknown(data['room_code']!, _roomCodeMeta));
    } else if (isInserting) {
      context.missing(_roomCodeMeta);
    }
    if (data.containsKey('last_ping')) {
      context.handle(_lastPingMeta,
          lastPing.isAcceptableOrUnknown(data['last_ping']!, _lastPingMeta));
    } else if (isInserting) {
      context.missing(_lastPingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      hasAnswered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_answered'])!,
      roomCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_code'])!,
      lastPing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_ping'])!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final String name;
  final int score;
  final bool hasAnswered;
  final String roomCode;
  final int lastPing;
  const Player(
      {required this.id,
      required this.name,
      required this.score,
      required this.hasAnswered,
      required this.roomCode,
      required this.lastPing});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['score'] = Variable<int>(score);
    map['has_answered'] = Variable<bool>(hasAnswered);
    map['room_code'] = Variable<String>(roomCode);
    map['last_ping'] = Variable<int>(lastPing);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      name: Value(name),
      score: Value(score),
      hasAnswered: Value(hasAnswered),
      roomCode: Value(roomCode),
      lastPing: Value(lastPing),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      score: serializer.fromJson<int>(json['score']),
      hasAnswered: serializer.fromJson<bool>(json['hasAnswered']),
      roomCode: serializer.fromJson<String>(json['roomCode']),
      lastPing: serializer.fromJson<int>(json['lastPing']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'score': serializer.toJson<int>(score),
      'hasAnswered': serializer.toJson<bool>(hasAnswered),
      'roomCode': serializer.toJson<String>(roomCode),
      'lastPing': serializer.toJson<int>(lastPing),
    };
  }

  Player copyWith(
          {int? id,
          String? name,
          int? score,
          bool? hasAnswered,
          String? roomCode,
          int? lastPing}) =>
      Player(
        id: id ?? this.id,
        name: name ?? this.name,
        score: score ?? this.score,
        hasAnswered: hasAnswered ?? this.hasAnswered,
        roomCode: roomCode ?? this.roomCode,
        lastPing: lastPing ?? this.lastPing,
      );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      score: data.score.present ? data.score.value : this.score,
      hasAnswered:
          data.hasAnswered.present ? data.hasAnswered.value : this.hasAnswered,
      roomCode: data.roomCode.present ? data.roomCode.value : this.roomCode,
      lastPing: data.lastPing.present ? data.lastPing.value : this.lastPing,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('score: $score, ')
          ..write('hasAnswered: $hasAnswered, ')
          ..write('roomCode: $roomCode, ')
          ..write('lastPing: $lastPing')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, score, hasAnswered, roomCode, lastPing);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.name == this.name &&
          other.score == this.score &&
          other.hasAnswered == this.hasAnswered &&
          other.roomCode == this.roomCode &&
          other.lastPing == this.lastPing);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> score;
  final Value<bool> hasAnswered;
  final Value<String> roomCode;
  final Value<int> lastPing;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.score = const Value.absent(),
    this.hasAnswered = const Value.absent(),
    this.roomCode = const Value.absent(),
    this.lastPing = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int score,
    required bool hasAnswered,
    required String roomCode,
    required int lastPing,
  })  : name = Value(name),
        score = Value(score),
        hasAnswered = Value(hasAnswered),
        roomCode = Value(roomCode),
        lastPing = Value(lastPing);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? score,
    Expression<bool>? hasAnswered,
    Expression<String>? roomCode,
    Expression<int>? lastPing,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (score != null) 'score': score,
      if (hasAnswered != null) 'has_answered': hasAnswered,
      if (roomCode != null) 'room_code': roomCode,
      if (lastPing != null) 'last_ping': lastPing,
    });
  }

  PlayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? score,
      Value<bool>? hasAnswered,
      Value<String>? roomCode,
      Value<int>? lastPing}) {
    return PlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,
      hasAnswered: hasAnswered ?? this.hasAnswered,
      roomCode: roomCode ?? this.roomCode,
      lastPing: lastPing ?? this.lastPing,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (hasAnswered.present) {
      map['has_answered'] = Variable<bool>(hasAnswered.value);
    }
    if (roomCode.present) {
      map['room_code'] = Variable<String>(roomCode.value);
    }
    if (lastPing.present) {
      map['last_ping'] = Variable<int>(lastPing.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('score: $score, ')
          ..write('hasAnswered: $hasAnswered, ')
          ..write('roomCode: $roomCode, ')
          ..write('lastPing: $lastPing')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomCodeMeta =
      const VerificationMeta('roomCode');
  @override
  late final GeneratedColumn<String> roomCode = GeneratedColumn<String>(
      'room_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES games (room_code)'));
  static const VerificationMeta _questionIndexMeta =
      const VerificationMeta('questionIndex');
  @override
  late final GeneratedColumn<int> questionIndex = GeneratedColumn<int>(
      'question_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctOptionIndexMeta =
      const VerificationMeta('correctOptionIndex');
  @override
  late final GeneratedColumn<int> correctOptionIndex = GeneratedColumn<int>(
      'correct_option_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomCode, questionIndex, content, options, correctOptionIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_code')) {
      context.handle(_roomCodeMeta,
          roomCode.isAcceptableOrUnknown(data['room_code']!, _roomCodeMeta));
    } else if (isInserting) {
      context.missing(_roomCodeMeta);
    }
    if (data.containsKey('question_index')) {
      context.handle(
          _questionIndexMeta,
          questionIndex.isAcceptableOrUnknown(
              data['question_index']!, _questionIndexMeta));
    } else if (isInserting) {
      context.missing(_questionIndexMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('options')) {
      context.handle(_optionsMeta,
          options.isAcceptableOrUnknown(data['options']!, _optionsMeta));
    } else if (isInserting) {
      context.missing(_optionsMeta);
    }
    if (data.containsKey('correct_option_index')) {
      context.handle(
          _correctOptionIndexMeta,
          correctOptionIndex.isAcceptableOrUnknown(
              data['correct_option_index']!, _correctOptionIndexMeta));
    } else if (isInserting) {
      context.missing(_correctOptionIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_code'])!,
      questionIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question_index'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      options: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options'])!,
      correctOptionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}correct_option_index'])!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final String roomCode;
  final int questionIndex;
  final String content;
  final String options;
  final int correctOptionIndex;
  const Question(
      {required this.id,
      required this.roomCode,
      required this.questionIndex,
      required this.content,
      required this.options,
      required this.correctOptionIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_code'] = Variable<String>(roomCode);
    map['question_index'] = Variable<int>(questionIndex);
    map['content'] = Variable<String>(content);
    map['options'] = Variable<String>(options);
    map['correct_option_index'] = Variable<int>(correctOptionIndex);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      roomCode: Value(roomCode),
      questionIndex: Value(questionIndex),
      content: Value(content),
      options: Value(options),
      correctOptionIndex: Value(correctOptionIndex),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      roomCode: serializer.fromJson<String>(json['roomCode']),
      questionIndex: serializer.fromJson<int>(json['questionIndex']),
      content: serializer.fromJson<String>(json['content']),
      options: serializer.fromJson<String>(json['options']),
      correctOptionIndex: serializer.fromJson<int>(json['correctOptionIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomCode': serializer.toJson<String>(roomCode),
      'questionIndex': serializer.toJson<int>(questionIndex),
      'content': serializer.toJson<String>(content),
      'options': serializer.toJson<String>(options),
      'correctOptionIndex': serializer.toJson<int>(correctOptionIndex),
    };
  }

  Question copyWith(
          {int? id,
          String? roomCode,
          int? questionIndex,
          String? content,
          String? options,
          int? correctOptionIndex}) =>
      Question(
        id: id ?? this.id,
        roomCode: roomCode ?? this.roomCode,
        questionIndex: questionIndex ?? this.questionIndex,
        content: content ?? this.content,
        options: options ?? this.options,
        correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      roomCode: data.roomCode.present ? data.roomCode.value : this.roomCode,
      questionIndex: data.questionIndex.present
          ? data.questionIndex.value
          : this.questionIndex,
      content: data.content.present ? data.content.value : this.content,
      options: data.options.present ? data.options.value : this.options,
      correctOptionIndex: data.correctOptionIndex.present
          ? data.correctOptionIndex.value
          : this.correctOptionIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('roomCode: $roomCode, ')
          ..write('questionIndex: $questionIndex, ')
          ..write('content: $content, ')
          ..write('options: $options, ')
          ..write('correctOptionIndex: $correctOptionIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, roomCode, questionIndex, content, options, correctOptionIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.roomCode == this.roomCode &&
          other.questionIndex == this.questionIndex &&
          other.content == this.content &&
          other.options == this.options &&
          other.correctOptionIndex == this.correctOptionIndex);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> roomCode;
  final Value<int> questionIndex;
  final Value<String> content;
  final Value<String> options;
  final Value<int> correctOptionIndex;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.roomCode = const Value.absent(),
    this.questionIndex = const Value.absent(),
    this.content = const Value.absent(),
    this.options = const Value.absent(),
    this.correctOptionIndex = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    required String roomCode,
    required int questionIndex,
    required String content,
    required String options,
    required int correctOptionIndex,
  })  : roomCode = Value(roomCode),
        questionIndex = Value(questionIndex),
        content = Value(content),
        options = Value(options),
        correctOptionIndex = Value(correctOptionIndex);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<String>? roomCode,
    Expression<int>? questionIndex,
    Expression<String>? content,
    Expression<String>? options,
    Expression<int>? correctOptionIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomCode != null) 'room_code': roomCode,
      if (questionIndex != null) 'question_index': questionIndex,
      if (content != null) 'content': content,
      if (options != null) 'options': options,
      if (correctOptionIndex != null)
        'correct_option_index': correctOptionIndex,
    });
  }

  QuestionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? roomCode,
      Value<int>? questionIndex,
      Value<String>? content,
      Value<String>? options,
      Value<int>? correctOptionIndex}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      roomCode: roomCode ?? this.roomCode,
      questionIndex: questionIndex ?? this.questionIndex,
      content: content ?? this.content,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomCode.present) {
      map['room_code'] = Variable<String>(roomCode.value);
    }
    if (questionIndex.present) {
      map['question_index'] = Variable<int>(questionIndex.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(options.value);
    }
    if (correctOptionIndex.present) {
      map['correct_option_index'] = Variable<int>(correctOptionIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('roomCode: $roomCode, ')
          ..write('questionIndex: $questionIndex, ')
          ..write('content: $content, ')
          ..write('options: $options, ')
          ..write('correctOptionIndex: $correctOptionIndex')
          ..write(')'))
        .toString();
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<int> question = GeneratedColumn<int>(
      'question', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES questions (id)'));
  static const VerificationMeta _answerIndexMeta =
      const VerificationMeta('answerIndex');
  @override
  late final GeneratedColumn<int> answerIndex = GeneratedColumn<int>(
      'answer_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _playerMeta = const VerificationMeta('player');
  @override
  late final GeneratedColumn<int> player = GeneratedColumn<int>(
      'player', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES players (id)'));
  static const VerificationMeta _gameMeta = const VerificationMeta('game');
  @override
  late final GeneratedColumn<int> game = GeneratedColumn<int>(
      'game', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES games (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, question, answerIndex, player, game];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answers';
  @override
  VerificationContext validateIntegrity(Insertable<Answer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer_index')) {
      context.handle(
          _answerIndexMeta,
          answerIndex.isAcceptableOrUnknown(
              data['answer_index']!, _answerIndexMeta));
    } else if (isInserting) {
      context.missing(_answerIndexMeta);
    }
    if (data.containsKey('player')) {
      context.handle(_playerMeta,
          player.isAcceptableOrUnknown(data['player']!, _playerMeta));
    } else if (isInserting) {
      context.missing(_playerMeta);
    }
    if (data.containsKey('game')) {
      context.handle(
          _gameMeta, game.isAcceptableOrUnknown(data['game']!, _gameMeta));
    } else if (isInserting) {
      context.missing(_gameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Answer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Answer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question'])!,
      answerIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}answer_index'])!,
      player: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player'])!,
      game: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game'])!,
    );
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(attachedDatabase, alias);
  }
}

class Answer extends DataClass implements Insertable<Answer> {
  final int id;
  final int question;
  final int answerIndex;
  final int player;
  final int game;
  const Answer(
      {required this.id,
      required this.question,
      required this.answerIndex,
      required this.player,
      required this.game});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question'] = Variable<int>(question);
    map['answer_index'] = Variable<int>(answerIndex);
    map['player'] = Variable<int>(player);
    map['game'] = Variable<int>(game);
    return map;
  }

  AnswersCompanion toCompanion(bool nullToAbsent) {
    return AnswersCompanion(
      id: Value(id),
      question: Value(question),
      answerIndex: Value(answerIndex),
      player: Value(player),
      game: Value(game),
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Answer(
      id: serializer.fromJson<int>(json['id']),
      question: serializer.fromJson<int>(json['question']),
      answerIndex: serializer.fromJson<int>(json['answerIndex']),
      player: serializer.fromJson<int>(json['player']),
      game: serializer.fromJson<int>(json['game']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'question': serializer.toJson<int>(question),
      'answerIndex': serializer.toJson<int>(answerIndex),
      'player': serializer.toJson<int>(player),
      'game': serializer.toJson<int>(game),
    };
  }

  Answer copyWith(
          {int? id, int? question, int? answerIndex, int? player, int? game}) =>
      Answer(
        id: id ?? this.id,
        question: question ?? this.question,
        answerIndex: answerIndex ?? this.answerIndex,
        player: player ?? this.player,
        game: game ?? this.game,
      );
  Answer copyWithCompanion(AnswersCompanion data) {
    return Answer(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      answerIndex:
          data.answerIndex.present ? data.answerIndex.value : this.answerIndex,
      player: data.player.present ? data.player.value : this.player,
      game: data.game.present ? data.game.value : this.game,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('answerIndex: $answerIndex, ')
          ..write('player: $player, ')
          ..write('game: $game')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, question, answerIndex, player, game);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Answer &&
          other.id == this.id &&
          other.question == this.question &&
          other.answerIndex == this.answerIndex &&
          other.player == this.player &&
          other.game == this.game);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<int> id;
  final Value<int> question;
  final Value<int> answerIndex;
  final Value<int> player;
  final Value<int> game;
  const AnswersCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.answerIndex = const Value.absent(),
    this.player = const Value.absent(),
    this.game = const Value.absent(),
  });
  AnswersCompanion.insert({
    this.id = const Value.absent(),
    required int question,
    required int answerIndex,
    required int player,
    required int game,
  })  : question = Value(question),
        answerIndex = Value(answerIndex),
        player = Value(player),
        game = Value(game);
  static Insertable<Answer> custom({
    Expression<int>? id,
    Expression<int>? question,
    Expression<int>? answerIndex,
    Expression<int>? player,
    Expression<int>? game,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (answerIndex != null) 'answer_index': answerIndex,
      if (player != null) 'player': player,
      if (game != null) 'game': game,
    });
  }

  AnswersCompanion copyWith(
      {Value<int>? id,
      Value<int>? question,
      Value<int>? answerIndex,
      Value<int>? player,
      Value<int>? game}) {
    return AnswersCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      answerIndex: answerIndex ?? this.answerIndex,
      player: player ?? this.player,
      game: game ?? this.game,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<int>(question.value);
    }
    if (answerIndex.present) {
      map['answer_index'] = Variable<int>(answerIndex.value);
    }
    if (player.present) {
      map['player'] = Variable<int>(player.value);
    }
    if (game.present) {
      map['game'] = Variable<int>(game.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswersCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('answerIndex: $answerIndex, ')
          ..write('player: $player, ')
          ..write('game: $game')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GamesTable games = $GamesTable(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $AnswersTable answers = $AnswersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [games, players, questions, answers];
}

typedef $$GamesTableCreateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  required String roomCode,
  required int currentQuestionIndex,
  required bool isGameStarted,
  required bool isGameOver,
});
typedef $$GamesTableUpdateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  Value<String> roomCode,
  Value<int> currentQuestionIndex,
  Value<bool> isGameStarted,
  Value<bool> isGameOver,
});

final class $$GamesTableReferences
    extends BaseReferences<_$AppDatabase, $GamesTable, Game> {
  $$GamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlayersTable, List<Player>> _playersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.players,
          aliasName:
              $_aliasNameGenerator(db.games.roomCode, db.players.roomCode));

  $$PlayersTableProcessedTableManager get playersRefs {
    final manager = $$PlayersTableTableManager($_db, $_db.players)
        .filter((f) => f.roomCode.roomCode($_item.roomCode));

    final cache = $_typedResult.readTableOrNull(_playersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$QuestionsTable, List<Question>>
      _questionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.questions,
          aliasName:
              $_aliasNameGenerator(db.games.roomCode, db.questions.roomCode));

  $$QuestionsTableProcessedTableManager get questionsRefs {
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.roomCode.roomCode($_item.roomCode));

    final cache = $_typedResult.readTableOrNull(_questionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AnswersTable, List<Answer>> _answersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.answers,
          aliasName: $_aliasNameGenerator(db.games.id, db.answers.game));

  $$AnswersTableProcessedTableManager get answersRefs {
    final manager = $$AnswersTableTableManager($_db, $_db.answers)
        .filter((f) => f.game.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_answersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GamesTableFilterComposer extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomCode => $composableBuilder(
      column: $table.roomCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGameStarted => $composableBuilder(
      column: $table.isGameStarted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGameOver => $composableBuilder(
      column: $table.isGameOver, builder: (column) => ColumnFilters(column));

  Expression<bool> playersRefs(
      Expression<bool> Function($$PlayersTableFilterComposer f) f) {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableFilterComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> questionsRefs(
      Expression<bool> Function($$QuestionsTableFilterComposer f) f) {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> answersRefs(
      Expression<bool> Function($$AnswersTableFilterComposer f) f) {
    final $$AnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.game,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableFilterComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GamesTableOrderingComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomCode => $composableBuilder(
      column: $table.roomCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGameStarted => $composableBuilder(
      column: $table.isGameStarted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGameOver => $composableBuilder(
      column: $table.isGameOver, builder: (column) => ColumnOrderings(column));
}

class $$GamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roomCode =>
      $composableBuilder(column: $table.roomCode, builder: (column) => column);

  GeneratedColumn<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex, builder: (column) => column);

  GeneratedColumn<bool> get isGameStarted => $composableBuilder(
      column: $table.isGameStarted, builder: (column) => column);

  GeneratedColumn<bool> get isGameOver => $composableBuilder(
      column: $table.isGameOver, builder: (column) => column);

  Expression<T> playersRefs<T extends Object>(
      Expression<T> Function($$PlayersTableAnnotationComposer a) f) {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableAnnotationComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> questionsRefs<T extends Object>(
      Expression<T> Function($$QuestionsTableAnnotationComposer a) f) {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> answersRefs<T extends Object>(
      Expression<T> Function($$AnswersTableAnnotationComposer a) f) {
    final $$AnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.game,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GamesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, $$GamesTableReferences),
    Game,
    PrefetchHooks Function(
        {bool playersRefs, bool questionsRefs, bool answersRefs})> {
  $$GamesTableTableManager(_$AppDatabase db, $GamesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> roomCode = const Value.absent(),
            Value<int> currentQuestionIndex = const Value.absent(),
            Value<bool> isGameStarted = const Value.absent(),
            Value<bool> isGameOver = const Value.absent(),
          }) =>
              GamesCompanion(
            id: id,
            roomCode: roomCode,
            currentQuestionIndex: currentQuestionIndex,
            isGameStarted: isGameStarted,
            isGameOver: isGameOver,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String roomCode,
            required int currentQuestionIndex,
            required bool isGameStarted,
            required bool isGameOver,
          }) =>
              GamesCompanion.insert(
            id: id,
            roomCode: roomCode,
            currentQuestionIndex: currentQuestionIndex,
            isGameStarted: isGameStarted,
            isGameOver: isGameOver,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GamesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {playersRefs = false,
              questionsRefs = false,
              answersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playersRefs) db.players,
                if (questionsRefs) db.questions,
                if (answersRefs) db.answers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GamesTableReferences._playersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GamesTableReferences(db, table, p0).playersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomCode == item.roomCode),
                        typedResults: items),
                  if (questionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GamesTableReferences._questionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GamesTableReferences(db, table, p0).questionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomCode == item.roomCode),
                        typedResults: items),
                  if (answersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GamesTableReferences._answersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GamesTableReferences(db, table, p0).answersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.game == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GamesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, $$GamesTableReferences),
    Game,
    PrefetchHooks Function(
        {bool playersRefs, bool questionsRefs, bool answersRefs})>;
typedef $$PlayersTableCreateCompanionBuilder = PlayersCompanion Function({
  Value<int> id,
  required String name,
  required int score,
  required bool hasAnswered,
  required String roomCode,
  required int lastPing,
});
typedef $$PlayersTableUpdateCompanionBuilder = PlayersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> score,
  Value<bool> hasAnswered,
  Value<String> roomCode,
  Value<int> lastPing,
});

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, Player> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _roomCodeTable(_$AppDatabase db) => db.games.createAlias(
      $_aliasNameGenerator(db.players.roomCode, db.games.roomCode));

  $$GamesTableProcessedTableManager? get roomCode {
    if ($_item.roomCode == null) return null;
    final manager = $$GamesTableTableManager($_db, $_db.games)
        .filter((f) => f.roomCode($_item.roomCode!));
    final item = $_typedResult.readTableOrNull(_roomCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AnswersTable, List<Answer>> _answersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.answers,
          aliasName: $_aliasNameGenerator(db.players.id, db.answers.player));

  $$AnswersTableProcessedTableManager get answersRefs {
    final manager = $$AnswersTableTableManager($_db, $_db.answers)
        .filter((f) => f.player.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_answersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasAnswered => $composableBuilder(
      column: $table.hasAnswered, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastPing => $composableBuilder(
      column: $table.lastPing, builder: (column) => ColumnFilters(column));

  $$GamesTableFilterComposer get roomCode {
    final $$GamesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableFilterComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> answersRefs(
      Expression<bool> Function($$AnswersTableFilterComposer f) f) {
    final $$AnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.player,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableFilterComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasAnswered => $composableBuilder(
      column: $table.hasAnswered, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastPing => $composableBuilder(
      column: $table.lastPing, builder: (column) => ColumnOrderings(column));

  $$GamesTableOrderingComposer get roomCode {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableOrderingComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<bool> get hasAnswered => $composableBuilder(
      column: $table.hasAnswered, builder: (column) => column);

  GeneratedColumn<int> get lastPing =>
      $composableBuilder(column: $table.lastPing, builder: (column) => column);

  $$GamesTableAnnotationComposer get roomCode {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableAnnotationComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> answersRefs<T extends Object>(
      Expression<T> Function($$AnswersTableAnnotationComposer a) f) {
    final $$AnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.player,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlayersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayersTable,
    Player,
    $$PlayersTableFilterComposer,
    $$PlayersTableOrderingComposer,
    $$PlayersTableAnnotationComposer,
    $$PlayersTableCreateCompanionBuilder,
    $$PlayersTableUpdateCompanionBuilder,
    (Player, $$PlayersTableReferences),
    Player,
    PrefetchHooks Function({bool roomCode, bool answersRefs})> {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<bool> hasAnswered = const Value.absent(),
            Value<String> roomCode = const Value.absent(),
            Value<int> lastPing = const Value.absent(),
          }) =>
              PlayersCompanion(
            id: id,
            name: name,
            score: score,
            hasAnswered: hasAnswered,
            roomCode: roomCode,
            lastPing: lastPing,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int score,
            required bool hasAnswered,
            required String roomCode,
            required int lastPing,
          }) =>
              PlayersCompanion.insert(
            id: id,
            name: name,
            score: score,
            hasAnswered: hasAnswered,
            roomCode: roomCode,
            lastPing: lastPing,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PlayersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({roomCode = false, answersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (answersRefs) db.answers],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roomCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomCode,
                    referencedTable:
                        $$PlayersTableReferences._roomCodeTable(db),
                    referencedColumn:
                        $$PlayersTableReferences._roomCodeTable(db).roomCode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (answersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PlayersTableReferences._answersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlayersTableReferences(db, table, p0).answersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.player == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlayersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayersTable,
    Player,
    $$PlayersTableFilterComposer,
    $$PlayersTableOrderingComposer,
    $$PlayersTableAnnotationComposer,
    $$PlayersTableCreateCompanionBuilder,
    $$PlayersTableUpdateCompanionBuilder,
    (Player, $$PlayersTableReferences),
    Player,
    PrefetchHooks Function({bool roomCode, bool answersRefs})>;
typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  required String roomCode,
  required int questionIndex,
  required String content,
  required String options,
  required int correctOptionIndex,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  Value<String> roomCode,
  Value<int> questionIndex,
  Value<String> content,
  Value<String> options,
  Value<int> correctOptionIndex,
});

final class $$QuestionsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _roomCodeTable(_$AppDatabase db) => db.games.createAlias(
      $_aliasNameGenerator(db.questions.roomCode, db.games.roomCode));

  $$GamesTableProcessedTableManager? get roomCode {
    if ($_item.roomCode == null) return null;
    final manager = $$GamesTableTableManager($_db, $_db.games)
        .filter((f) => f.roomCode($_item.roomCode!));
    final item = $_typedResult.readTableOrNull(_roomCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AnswersTable, List<Answer>> _answersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.answers,
          aliasName:
              $_aliasNameGenerator(db.questions.id, db.answers.question));

  $$AnswersTableProcessedTableManager get answersRefs {
    final manager = $$AnswersTableTableManager($_db, $_db.answers)
        .filter((f) => f.question.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_answersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get questionIndex => $composableBuilder(
      column: $table.questionIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex,
      builder: (column) => ColumnFilters(column));

  $$GamesTableFilterComposer get roomCode {
    final $$GamesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableFilterComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> answersRefs(
      Expression<bool> Function($$AnswersTableFilterComposer f) f) {
    final $$AnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.question,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableFilterComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get questionIndex => $composableBuilder(
      column: $table.questionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex,
      builder: (column) => ColumnOrderings(column));

  $$GamesTableOrderingComposer get roomCode {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableOrderingComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get questionIndex => $composableBuilder(
      column: $table.questionIndex, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex, builder: (column) => column);

  $$GamesTableAnnotationComposer get roomCode {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomCode,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.roomCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableAnnotationComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> answersRefs<T extends Object>(
      Expression<T> Function($$AnswersTableAnnotationComposer a) f) {
    final $$AnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.question,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool roomCode, bool answersRefs})> {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> roomCode = const Value.absent(),
            Value<int> questionIndex = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> options = const Value.absent(),
            Value<int> correctOptionIndex = const Value.absent(),
          }) =>
              QuestionsCompanion(
            id: id,
            roomCode: roomCode,
            questionIndex: questionIndex,
            content: content,
            options: options,
            correctOptionIndex: correctOptionIndex,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String roomCode,
            required int questionIndex,
            required String content,
            required String options,
            required int correctOptionIndex,
          }) =>
              QuestionsCompanion.insert(
            id: id,
            roomCode: roomCode,
            questionIndex: questionIndex,
            content: content,
            options: options,
            correctOptionIndex: correctOptionIndex,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roomCode = false, answersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (answersRefs) db.answers],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roomCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomCode,
                    referencedTable:
                        $$QuestionsTableReferences._roomCodeTable(db),
                    referencedColumn:
                        $$QuestionsTableReferences._roomCodeTable(db).roomCode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (answersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$QuestionsTableReferences._answersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestionsTableReferences(db, table, p0)
                                .answersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.question == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuestionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool roomCode, bool answersRefs})>;
typedef $$AnswersTableCreateCompanionBuilder = AnswersCompanion Function({
  Value<int> id,
  required int question,
  required int answerIndex,
  required int player,
  required int game,
});
typedef $$AnswersTableUpdateCompanionBuilder = AnswersCompanion Function({
  Value<int> id,
  Value<int> question,
  Value<int> answerIndex,
  Value<int> player,
  Value<int> game,
});

final class $$AnswersTableReferences
    extends BaseReferences<_$AppDatabase, $AnswersTable, Answer> {
  $$AnswersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestionsTable _questionTable(_$AppDatabase db) => db.questions
      .createAlias($_aliasNameGenerator(db.answers.question, db.questions.id));

  $$QuestionsTableProcessedTableManager? get question {
    if ($_item.question == null) return null;
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.id($_item.question!));
    final item = $_typedResult.readTableOrNull(_questionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlayersTable _playerTable(_$AppDatabase db) => db.players
      .createAlias($_aliasNameGenerator(db.answers.player, db.players.id));

  $$PlayersTableProcessedTableManager? get player {
    if ($_item.player == null) return null;
    final manager = $$PlayersTableTableManager($_db, $_db.players)
        .filter((f) => f.id($_item.player!));
    final item = $_typedResult.readTableOrNull(_playerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GamesTable _gameTable(_$AppDatabase db) =>
      db.games.createAlias($_aliasNameGenerator(db.answers.game, db.games.id));

  $$GamesTableProcessedTableManager? get game {
    if ($_item.game == null) return null;
    final manager = $$GamesTableTableManager($_db, $_db.games)
        .filter((f) => f.id($_item.game!));
    final item = $_typedResult.readTableOrNull(_gameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AnswersTableFilterComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get answerIndex => $composableBuilder(
      column: $table.answerIndex, builder: (column) => ColumnFilters(column));

  $$QuestionsTableFilterComposer get question {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.question,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlayersTableFilterComposer get player {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.player,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableFilterComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GamesTableFilterComposer get game {
    final $$GamesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.game,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableFilterComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get answerIndex => $composableBuilder(
      column: $table.answerIndex, builder: (column) => ColumnOrderings(column));

  $$QuestionsTableOrderingComposer get question {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.question,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableOrderingComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlayersTableOrderingComposer get player {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.player,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableOrderingComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GamesTableOrderingComposer get game {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.game,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableOrderingComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get answerIndex => $composableBuilder(
      column: $table.answerIndex, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get question {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.question,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlayersTableAnnotationComposer get player {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.player,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableAnnotationComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GamesTableAnnotationComposer get game {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.game,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableAnnotationComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool question, bool player, bool game})> {
  $$AnswersTableTableManager(_$AppDatabase db, $AnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> question = const Value.absent(),
            Value<int> answerIndex = const Value.absent(),
            Value<int> player = const Value.absent(),
            Value<int> game = const Value.absent(),
          }) =>
              AnswersCompanion(
            id: id,
            question: question,
            answerIndex: answerIndex,
            player: player,
            game: game,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int question,
            required int answerIndex,
            required int player,
            required int game,
          }) =>
              AnswersCompanion.insert(
            id: id,
            question: question,
            answerIndex: answerIndex,
            player: player,
            game: game,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AnswersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {question = false, player = false, game = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (question) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.question,
                    referencedTable:
                        $$AnswersTableReferences._questionTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._questionTable(db).id,
                  ) as T;
                }
                if (player) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.player,
                    referencedTable: $$AnswersTableReferences._playerTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._playerTable(db).id,
                  ) as T;
                }
                if (game) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.game,
                    referencedTable: $$AnswersTableReferences._gameTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._gameTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AnswersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool question, bool player, bool game})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GamesTableTableManager get games =>
      $$GamesTableTableManager(_db, _db.games);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$AnswersTableTableManager get answers =>
      $$AnswersTableTableManager(_db, _db.answers);
}
