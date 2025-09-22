import 'package:drift/drift.dart';

class BowelLogs extends Table {
  IntColumn get id => integer().autoIncrement()(); // PK
  IntColumn get amount => integer()(); // 量
  IntColumn get color => integer()(); // 色
  IntColumn get shape => integer()(); // 形
  IntColumn get thickness => integer()(); // 太さ
  IntColumn get smell => integer()(); // 匂い
  TextColumn get memo => text().nullable()(); // メモ
  DateTimeColumn get createdAt => dateTime()(); // 登録日時
  DateTimeColumn get updatedAt => dateTime()(); // 更新日時
}
