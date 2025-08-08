import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';

class UserEntity {
  final String? uid;
  final String displayName;
  final String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isPremium;

  const UserEntity({
    this.uid,
    required this.displayName,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.isPremium,
  });

  UsersCompanion toCompanion({bool nullToAbsent = true}) {
    return UsersCompanion(
      uid: uid != null ? Value(uid!) : const Value.absent(),
      displayName: Value(displayName),
      email: Value(email),
      createdAt: createdAt != null
          ? Value(createdAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
      updatedAt: updatedAt != null
          ? Value(updatedAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
      isPremium: isPremium != null ? Value(isPremium!) : const Value.absent(),
    );
  }

  static UserEntity fromData(User data) {
    return UserEntity(
      uid: data.uid,
      displayName: data.displayName,
      email: data.email,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isPremium: data.isPremium,
    );
  }
}
