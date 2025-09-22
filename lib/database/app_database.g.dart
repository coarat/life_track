// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isPremiumMeta =
      const VerificationMeta('isPremium');
  @override
  late final GeneratedColumn<bool> isPremium = GeneratedColumn<bool>(
      'is_premium', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_premium" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [uid, displayName, email, createdAt, updatedAt, isPremium];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_premium')) {
      context.handle(_isPremiumMeta,
          isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isPremium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_premium']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String uid;
  final String displayName;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool? isPremium;
  const User(
      {required this.uid,
      required this.displayName,
      required this.email,
      required this.createdAt,
      required this.updatedAt,
      this.isPremium});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['display_name'] = Variable<String>(displayName);
    map['email'] = Variable<String>(email);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || isPremium != null) {
      map['is_premium'] = Variable<bool>(isPremium);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uid: Value(uid),
      displayName: Value(displayName),
      email: Value(email),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isPremium: isPremium == null && nullToAbsent
          ? const Value.absent()
          : Value(isPremium),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      uid: serializer.fromJson<String>(json['uid']),
      displayName: serializer.fromJson<String>(json['displayName']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isPremium: serializer.fromJson<bool?>(json['isPremium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'displayName': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isPremium': serializer.toJson<bool?>(isPremium),
    };
  }

  User copyWith(
          {String? uid,
          String? displayName,
          String? email,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<bool?> isPremium = const Value.absent()}) =>
      User(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isPremium: isPremium.present ? isPremium.value : this.isPremium,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      uid: data.uid.present ? data.uid.value : this.uid,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isPremium: data.isPremium.present ? data.isPremium.value : this.isPremium,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('uid: $uid, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isPremium: $isPremium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uid, displayName, email, createdAt, updatedAt, isPremium);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.uid == this.uid &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isPremium == this.isPremium);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> uid;
  final Value<String> displayName;
  final Value<String> email;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool?> isPremium;
  final Value<int> rowid;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uid,
    required String displayName,
    required String email,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isPremium = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        displayName = Value(displayName),
        email = Value(email),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? uid,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isPremium,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isPremium != null) 'is_premium': isPremium,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? uid,
      Value<String>? displayName,
      Value<String>? email,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool?>? isPremium,
      Value<int>? rowid}) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPremium: isPremium ?? this.isPremium,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isPremium: $isPremium, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoodLogsTable extends FoodLogs with TableInfo<$FoodLogsTable, FoodLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _foodMeta = const VerificationMeta('food');
  @override
  late final GeneratedColumn<String> food = GeneratedColumn<String>(
      'food', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, food, imagePath, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_logs';
  @override
  VerificationContext validateIntegrity(Insertable<FoodLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('food')) {
      context.handle(
          _foodMeta, food.isAcceptableOrUnknown(data['food']!, _foodMeta));
    } else if (isInserting) {
      context.missing(_foodMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      food: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FoodLogsTable createAlias(String alias) {
    return $FoodLogsTable(attachedDatabase, alias);
  }
}

class FoodLog extends DataClass implements Insertable<FoodLog> {
  final int id;
  final String food;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const FoodLog(
      {required this.id,
      required this.food,
      this.imagePath,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['food'] = Variable<String>(food);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FoodLogsCompanion toCompanion(bool nullToAbsent) {
    return FoodLogsCompanion(
      id: Value(id),
      food: Value(food),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FoodLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodLog(
      id: serializer.fromJson<int>(json['id']),
      food: serializer.fromJson<String>(json['food']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'food': serializer.toJson<String>(food),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FoodLog copyWith(
          {int? id,
          String? food,
          Value<String?> imagePath = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      FoodLog(
        id: id ?? this.id,
        food: food ?? this.food,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FoodLog copyWithCompanion(FoodLogsCompanion data) {
    return FoodLog(
      id: data.id.present ? data.id.value : this.id,
      food: data.food.present ? data.food.value : this.food,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodLog(')
          ..write('id: $id, ')
          ..write('food: $food, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, food, imagePath, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodLog &&
          other.id == this.id &&
          other.food == this.food &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FoodLogsCompanion extends UpdateCompanion<FoodLog> {
  final Value<int> id;
  final Value<String> food;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FoodLogsCompanion({
    this.id = const Value.absent(),
    this.food = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FoodLogsCompanion.insert({
    this.id = const Value.absent(),
    required String food,
    this.imagePath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : food = Value(food),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FoodLog> custom({
    Expression<int>? id,
    Expression<String>? food,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (food != null) 'food': food,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FoodLogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? food,
      Value<String?>? imagePath,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return FoodLogsCompanion(
      id: id ?? this.id,
      food: food ?? this.food,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (food.present) {
      map['food'] = Variable<String>(food.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodLogsCompanion(')
          ..write('id: $id, ')
          ..write('food: $food, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BowelLogsTable extends BowelLogs
    with TableInfo<$BowelLogsTable, BowelLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BowelLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shapeMeta = const VerificationMeta('shape');
  @override
  late final GeneratedColumn<int> shape = GeneratedColumn<int>(
      'shape', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thicknessMeta =
      const VerificationMeta('thickness');
  @override
  late final GeneratedColumn<int> thickness = GeneratedColumn<int>(
      'thickness', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _smellMeta = const VerificationMeta('smell');
  @override
  late final GeneratedColumn<int> smell = GeneratedColumn<int>(
      'smell', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, color, shape, thickness, smell, memo, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bowel_logs';
  @override
  VerificationContext validateIntegrity(Insertable<BowelLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('shape')) {
      context.handle(
          _shapeMeta, shape.isAcceptableOrUnknown(data['shape']!, _shapeMeta));
    } else if (isInserting) {
      context.missing(_shapeMeta);
    }
    if (data.containsKey('thickness')) {
      context.handle(_thicknessMeta,
          thickness.isAcceptableOrUnknown(data['thickness']!, _thicknessMeta));
    } else if (isInserting) {
      context.missing(_thicknessMeta);
    }
    if (data.containsKey('smell')) {
      context.handle(
          _smellMeta, smell.isAcceptableOrUnknown(data['smell']!, _smellMeta));
    } else if (isInserting) {
      context.missing(_smellMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BowelLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BowelLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      shape: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shape'])!,
      thickness: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}thickness'])!,
      smell: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}smell'])!,
      memo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BowelLogsTable createAlias(String alias) {
    return $BowelLogsTable(attachedDatabase, alias);
  }
}

class BowelLog extends DataClass implements Insertable<BowelLog> {
  final int id;
  final int amount;
  final int color;
  final int shape;
  final int thickness;
  final int smell;
  final String? memo;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BowelLog(
      {required this.id,
      required this.amount,
      required this.color,
      required this.shape,
      required this.thickness,
      required this.smell,
      this.memo,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['color'] = Variable<int>(color);
    map['shape'] = Variable<int>(shape);
    map['thickness'] = Variable<int>(thickness);
    map['smell'] = Variable<int>(smell);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BowelLogsCompanion toCompanion(bool nullToAbsent) {
    return BowelLogsCompanion(
      id: Value(id),
      amount: Value(amount),
      color: Value(color),
      shape: Value(shape),
      thickness: Value(thickness),
      smell: Value(smell),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BowelLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BowelLog(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      color: serializer.fromJson<int>(json['color']),
      shape: serializer.fromJson<int>(json['shape']),
      thickness: serializer.fromJson<int>(json['thickness']),
      smell: serializer.fromJson<int>(json['smell']),
      memo: serializer.fromJson<String?>(json['memo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'color': serializer.toJson<int>(color),
      'shape': serializer.toJson<int>(shape),
      'thickness': serializer.toJson<int>(thickness),
      'smell': serializer.toJson<int>(smell),
      'memo': serializer.toJson<String?>(memo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BowelLog copyWith(
          {int? id,
          int? amount,
          int? color,
          int? shape,
          int? thickness,
          int? smell,
          Value<String?> memo = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BowelLog(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        color: color ?? this.color,
        shape: shape ?? this.shape,
        thickness: thickness ?? this.thickness,
        smell: smell ?? this.smell,
        memo: memo.present ? memo.value : this.memo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BowelLog copyWithCompanion(BowelLogsCompanion data) {
    return BowelLog(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      color: data.color.present ? data.color.value : this.color,
      shape: data.shape.present ? data.shape.value : this.shape,
      thickness: data.thickness.present ? data.thickness.value : this.thickness,
      smell: data.smell.present ? data.smell.value : this.smell,
      memo: data.memo.present ? data.memo.value : this.memo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BowelLog(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('color: $color, ')
          ..write('shape: $shape, ')
          ..write('thickness: $thickness, ')
          ..write('smell: $smell, ')
          ..write('memo: $memo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, amount, color, shape, thickness, smell, memo, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BowelLog &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.color == this.color &&
          other.shape == this.shape &&
          other.thickness == this.thickness &&
          other.smell == this.smell &&
          other.memo == this.memo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BowelLogsCompanion extends UpdateCompanion<BowelLog> {
  final Value<int> id;
  final Value<int> amount;
  final Value<int> color;
  final Value<int> shape;
  final Value<int> thickness;
  final Value<int> smell;
  final Value<String?> memo;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BowelLogsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.color = const Value.absent(),
    this.shape = const Value.absent(),
    this.thickness = const Value.absent(),
    this.smell = const Value.absent(),
    this.memo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BowelLogsCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required int color,
    required int shape,
    required int thickness,
    required int smell,
    this.memo = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : amount = Value(amount),
        color = Value(color),
        shape = Value(shape),
        thickness = Value(thickness),
        smell = Value(smell),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BowelLog> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<int>? color,
    Expression<int>? shape,
    Expression<int>? thickness,
    Expression<int>? smell,
    Expression<String>? memo,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (color != null) 'color': color,
      if (shape != null) 'shape': shape,
      if (thickness != null) 'thickness': thickness,
      if (smell != null) 'smell': smell,
      if (memo != null) 'memo': memo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BowelLogsCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<int>? color,
      Value<int>? shape,
      Value<int>? thickness,
      Value<int>? smell,
      Value<String?>? memo,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BowelLogsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      color: color ?? this.color,
      shape: shape ?? this.shape,
      thickness: thickness ?? this.thickness,
      smell: smell ?? this.smell,
      memo: memo ?? this.memo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (shape.present) {
      map['shape'] = Variable<int>(shape.value);
    }
    if (thickness.present) {
      map['thickness'] = Variable<int>(thickness.value);
    }
    if (smell.present) {
      map['smell'] = Variable<int>(smell.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BowelLogsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('color: $color, ')
          ..write('shape: $shape, ')
          ..write('thickness: $thickness, ')
          ..write('smell: $smell, ')
          ..write('memo: $memo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $FoodLogsTable foodLogs = $FoodLogsTable(this);
  late final $BowelLogsTable bowelLogs = $BowelLogsTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final FoodLogDao foodLogDao = FoodLogDao(this as AppDatabase);
  late final BowelLogDao bowelLogDao = BowelLogDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, foodLogs, bowelLogs];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String uid,
  required String displayName,
  required String email,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool?> isPremium,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> uid,
  Value<String> displayName,
  Value<String> email,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool?> isPremium,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPremium => $composableBuilder(
      column: $table.isPremium, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPremium => $composableBuilder(
      column: $table.isPremium, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isPremium =>
      $composableBuilder(column: $table.isPremium, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool?> isPremium = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            uid: uid,
            displayName: displayName,
            email: email,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isPremium: isPremium,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String displayName,
            required String email,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool?> isPremium = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            uid: uid,
            displayName: displayName,
            email: email,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isPremium: isPremium,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$FoodLogsTableCreateCompanionBuilder = FoodLogsCompanion Function({
  Value<int> id,
  required String food,
  Value<String?> imagePath,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$FoodLogsTableUpdateCompanionBuilder = FoodLogsCompanion Function({
  Value<int> id,
  Value<String> food,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$FoodLogsTableFilterComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get food => $composableBuilder(
      column: $table.food, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$FoodLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get food => $composableBuilder(
      column: $table.food, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$FoodLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodLogsTable> {
  $$FoodLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get food =>
      $composableBuilder(column: $table.food, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FoodLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FoodLogsTable,
    FoodLog,
    $$FoodLogsTableFilterComposer,
    $$FoodLogsTableOrderingComposer,
    $$FoodLogsTableAnnotationComposer,
    $$FoodLogsTableCreateCompanionBuilder,
    $$FoodLogsTableUpdateCompanionBuilder,
    (FoodLog, BaseReferences<_$AppDatabase, $FoodLogsTable, FoodLog>),
    FoodLog,
    PrefetchHooks Function()> {
  $$FoodLogsTableTableManager(_$AppDatabase db, $FoodLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> food = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FoodLogsCompanion(
            id: id,
            food: food,
            imagePath: imagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String food,
            Value<String?> imagePath = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              FoodLogsCompanion.insert(
            id: id,
            food: food,
            imagePath: imagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FoodLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FoodLogsTable,
    FoodLog,
    $$FoodLogsTableFilterComposer,
    $$FoodLogsTableOrderingComposer,
    $$FoodLogsTableAnnotationComposer,
    $$FoodLogsTableCreateCompanionBuilder,
    $$FoodLogsTableUpdateCompanionBuilder,
    (FoodLog, BaseReferences<_$AppDatabase, $FoodLogsTable, FoodLog>),
    FoodLog,
    PrefetchHooks Function()>;
typedef $$BowelLogsTableCreateCompanionBuilder = BowelLogsCompanion Function({
  Value<int> id,
  required int amount,
  required int color,
  required int shape,
  required int thickness,
  required int smell,
  Value<String?> memo,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$BowelLogsTableUpdateCompanionBuilder = BowelLogsCompanion Function({
  Value<int> id,
  Value<int> amount,
  Value<int> color,
  Value<int> shape,
  Value<int> thickness,
  Value<int> smell,
  Value<String?> memo,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$BowelLogsTableFilterComposer
    extends Composer<_$AppDatabase, $BowelLogsTable> {
  $$BowelLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get thickness => $composableBuilder(
      column: $table.thickness, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get smell => $composableBuilder(
      column: $table.smell, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BowelLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $BowelLogsTable> {
  $$BowelLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get thickness => $composableBuilder(
      column: $table.thickness, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get smell => $composableBuilder(
      column: $table.smell, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BowelLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BowelLogsTable> {
  $$BowelLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get shape =>
      $composableBuilder(column: $table.shape, builder: (column) => column);

  GeneratedColumn<int> get thickness =>
      $composableBuilder(column: $table.thickness, builder: (column) => column);

  GeneratedColumn<int> get smell =>
      $composableBuilder(column: $table.smell, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BowelLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BowelLogsTable,
    BowelLog,
    $$BowelLogsTableFilterComposer,
    $$BowelLogsTableOrderingComposer,
    $$BowelLogsTableAnnotationComposer,
    $$BowelLogsTableCreateCompanionBuilder,
    $$BowelLogsTableUpdateCompanionBuilder,
    (BowelLog, BaseReferences<_$AppDatabase, $BowelLogsTable, BowelLog>),
    BowelLog,
    PrefetchHooks Function()> {
  $$BowelLogsTableTableManager(_$AppDatabase db, $BowelLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BowelLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BowelLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BowelLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<int> shape = const Value.absent(),
            Value<int> thickness = const Value.absent(),
            Value<int> smell = const Value.absent(),
            Value<String?> memo = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BowelLogsCompanion(
            id: id,
            amount: amount,
            color: color,
            shape: shape,
            thickness: thickness,
            smell: smell,
            memo: memo,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int amount,
            required int color,
            required int shape,
            required int thickness,
            required int smell,
            Value<String?> memo = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              BowelLogsCompanion.insert(
            id: id,
            amount: amount,
            color: color,
            shape: shape,
            thickness: thickness,
            smell: smell,
            memo: memo,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BowelLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BowelLogsTable,
    BowelLog,
    $$BowelLogsTableFilterComposer,
    $$BowelLogsTableOrderingComposer,
    $$BowelLogsTableAnnotationComposer,
    $$BowelLogsTableCreateCompanionBuilder,
    $$BowelLogsTableUpdateCompanionBuilder,
    (BowelLog, BaseReferences<_$AppDatabase, $BowelLogsTable, BowelLog>),
    BowelLog,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$FoodLogsTableTableManager get foodLogs =>
      $$FoodLogsTableTableManager(_db, _db.foodLogs);
  $$BowelLogsTableTableManager get bowelLogs =>
      $$BowelLogsTableTableManager(_db, _db.bowelLogs);
}
