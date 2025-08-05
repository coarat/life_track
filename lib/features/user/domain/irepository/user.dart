import 'package:life_track/features/user/domain/entities/user.dart';

abstract class IUserRepository {
  Future<int> insert(UserEntity user);
  Future<bool> update(UserEntity user);
  Future<int> delete(int id);
}
