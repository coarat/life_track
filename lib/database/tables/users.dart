import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get uid => text()(); // Firebase UID
  TextColumn get displayName => text()(); // 表示名
  TextColumn get email => text()(); // メールアドレス
  DateTimeColumn get createdAt => dateTime()(); // 登録日時
  DateTimeColumn get updatedAt => dateTime()(); // 更新日時
  BoolColumn get isPremium => boolean().nullable()(); // 有料フラグ（任意）

  @override
  Set<Column> get primaryKey => {uid}; // 念のため指定しておくと安心
}
