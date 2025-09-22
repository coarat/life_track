import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_track/database/app_database.dart';

// dao
import 'package:life_track/database/daos/user.dart';
import 'package:life_track/database/daos/food_log.dart';
import 'package:life_track/database/daos/bowel_log.dart';

// repository
import 'package:life_track/features/user/repository/user.dart';
import 'package:life_track/features/log/repository/food_log.dart';
import 'package:life_track/features/log/repository/bowel_log.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

final initialRouteProvider = FutureProvider<String>((ref) async {
  final userDao = ref.watch(userDaoProvider);
  final user = await userDao.getSingleOrNullRecord();
  return user == null ? '/user/create' : '/';
});

final userDaoProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return UserDao(db);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dao = ref.watch(userDaoProvider);
  return UserRepository(dao);
});

final foodLogDaoProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return FoodLogDao(db);
});

final foodLogRepositoryProvider = Provider<FoodLogRepository>((ref) {
  final dao = ref.watch(foodLogDaoProvider);
  return FoodLogRepository(dao);
});

final bowelLogDaoProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return BowelLogDao(db);
});

final bowelLogRepositoryProvider = Provider<BowelLogRepository>((ref) {
  final dao = ref.watch(bowelLogDaoProvider);
  return BowelLogRepository(dao);
});
