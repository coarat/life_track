import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()(); // ID（主キー）
  TextColumn get displayName => text()(); // 表示名
  TextColumn get email => text()(); // メールアドレス
  DateTimeColumn get createdAt => dateTime()(); // 登録日時
  DateTimeColumn get updatedAt => dateTime()(); // 更新日時
  BoolColumn get isPremium => boolean().nullable()(); // 有料フラグ（任意）
}
