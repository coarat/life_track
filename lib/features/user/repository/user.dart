import 'package:life_track/features/user/domain/irepository/user.dart';
import 'package:life_track/database/daos/user.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/features/user/domain/entities/user.dart';
import 'package:drift/drift.dart';

class UserRepository implements IUserRepository {
  final UserDao _dao;

  UserRepository(this._dao);

  @override
  Future<int> insert(UserEntity user) {
    final entry = user.toCompanion();
    return _dao.insertRecord(entry);
  }

  @override
  Future<bool> update(UserEntity user) {
    final entry = user.toCompanion();
    return _dao.updateRecord(entry);
  }

  @override
  Future<int> delete(int id) {
    final entry = UsersCompanion(id: Value(id));
    return _dao.deleteRecord(entry);
  }

  Stream<List<UserEntity>> watchAllUsers() {
    return _dao
        .watchAllUsers()
        .map((rows) => rows.map((row) => UserEntity.fromData(row)).toList());
  }
}
