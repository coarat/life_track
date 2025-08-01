class UserEntity {
  final int? id;
  final String displayName;
  final String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isPremium;

  const UserEntity({
    this.id,
    required this.displayName,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.isPremium,
  });
}