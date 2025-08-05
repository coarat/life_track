import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/database/daos/user.dart';
import 'package:life_track/features/user/repository/user.dart';

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
