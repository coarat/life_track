import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/users.dart';

import './user_dao_interface.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin implements IUserDao {
  UserDao(super.db);

  @override
  Future<void> insertUser({
    required String displayName,
    required String email,
    bool isPremium = false,
  }) {
    final now = DateTime.now();
    return into(users).insert(
      UsersCompanion(
        displayName: Value(displayName),
        email: Value(email),
        createdAt: Value(now),
        updatedAt: Value(now),
        isPremium: Value(isPremium),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> updateUser({
    required int id,
    String? displayName,
    String? email,
    bool? isPremium,
  }) {
    final now = DateTime.now();
    return (update(users)..where((tbl) => tbl.id.equals(id))).write(
      UsersCompanion(
        displayName: displayName != null ? Value(displayName) : Value.absent(),
        email: email != null ? Value(email) : Value.absent(),
        updatedAt: Value(now), // ← 更新時に自動で上書き
        isPremium: isPremium != null ? Value(isPremium) : Value.absent(),
      ),
    );
  }

  @override
  Future<void> deleteUser(int id) =>
      (delete(users)..where((tbl) => tbl.id.equals(id))).go();
}
