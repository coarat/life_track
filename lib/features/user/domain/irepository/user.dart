import 'package:life_track/features/user/domain/entities/user.dart';

abstract class IUserRepository {
  Future<void> insert(UserEntity user);
  Future<void> update(UserEntity user);
  Future<void> delete(String id);
}
