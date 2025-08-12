import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/database/tables/users.dart';

import 'base.dart';

part 'user.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends BaseDao<Users, User> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db, db.users);
}
