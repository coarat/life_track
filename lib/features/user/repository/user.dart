import 'package:life_track/features/user/domain/irepository/user.dart';
import 'package:life_track/database/daos/user.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/features/user/domain/entities/user.dart';
import 'package:drift/drift.dart';

class UserRepository implements IUserRepository {
  final UserDao _dao;

  UserRepository(this._dao);

  @override
  Future<void> insert(UserEntity user) async {
    final entry = user.toCompanion();
    _dao.insertRecord(entry);
    return;
  }

  @override
  Future<void> update(UserEntity user) async {
    final entry = user.toCompanion();
    _dao.updateRecord(entry);
    return;
  }

  @override
  Future<void> delete(String uid) async {
    final entry = UsersCompanion(uid: Value(uid));
    _dao.deleteRecord(entry);
    return;
  }

  Stream<List<UserEntity>> watchAllUsers() {
    return _dao
        .watchAllUsers()
        .map((rows) => rows.map((row) => UserEntity.fromData(row)).toList());
  }
}
