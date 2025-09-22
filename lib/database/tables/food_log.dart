import 'package:drift/drift.dart';

class FoodLogs extends Table {
  IntColumn get id => integer().autoIncrement()(); // PK
  TextColumn get food => text()(); // 品目1(カンマ区切り)
  TextColumn get imagePath => text().nullable()(); // 写真
  DateTimeColumn get createdAt => dateTime()(); // 登録日時
  DateTimeColumn get updatedAt => dateTime()(); // 更新日時
}
