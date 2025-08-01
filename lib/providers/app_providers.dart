import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart';
import '../database/daos/user_dao_interface.dart';
import '../database/daos/user_dao.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

final userDaoProvider = Provider<IUserDao>((ref) {
  final db = ref.watch(dbProvider);
  return UserDao(db); // ← 実装を返すだけ
});
