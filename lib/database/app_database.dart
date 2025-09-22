import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// tables
import 'package:life_track/database/tables/users.dart';
import 'package:life_track/database/tables/food_log.dart';
import 'package:life_track/database/tables/bowel_log.dart';

// daos
import 'package:life_track/database/daos/user.dart';
import 'package:life_track/database/daos/food_log.dart';
import 'package:life_track/database/daos/bowel_log.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [Users, FoodLogs, BowelLogs],
    daos: [UserDao, FoodLogDao, BowelLogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase(file);
  });
}
