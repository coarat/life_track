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
    await _dao.insertRecord(entry);
    return;
  }

  @override
  Future<void> update(UserEntity user) async {
    final entry = user.toCompanion();
    await _dao.updateRecord(entry);
    return;
  }

  @override
  Future<void> delete(String uid) async {
    final entry = UsersCompanion(uid: Value(uid));
    await _dao.deleteRecord(entry);
    return;
  }

  @override
  Future<UserEntity?> get(String uid) async {
    final entry = await _dao.getRecordById((T) => T.uid.equals(uid));
    if (entry == null) {
      return null;
    }
    final entity = UserEntity.fromData(entry);
    return entity;
  }
}
