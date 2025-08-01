abstract class IUserDao {
  Future<void> insertUser({
    required String displayName,
    required String email,
    bool isPremium = false,
  });
  Future<void> updateUser({
    required int id,
    String? displayName,
    String? email,
    bool? isPremium,
  });
  Future<void> deleteUser(int id);
}