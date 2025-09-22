import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/database/tables/food_log.dart';

import 'base.dart';

part 'food_log.g.dart';

@DriftAccessor(tables: [FoodLogs])
class FoodLogDao extends BaseDao<FoodLogs, FoodLog> with _$FoodLogDaoMixin {
  FoodLogDao(AppDatabase db) : super(db, db.foodLogs);
}
