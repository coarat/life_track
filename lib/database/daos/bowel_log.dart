import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/database/tables/bowel_log.dart';

import 'base.dart';

part 'bowel_log.g.dart';

@DriftAccessor(tables: [BowelLogs])
class BowelLogDao extends BaseDao<BowelLogs, BowelLog> with _$BowelLogDaoMixin {
  BowelLogDao(AppDatabase db) : super(db, db.bowelLogs);
}
