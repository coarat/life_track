import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';

class FoodLogEntity {
  final int? id;
  final List<String> foods;
  final String? imagePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FoodLogEntity({
    this.id,
    required this.foods,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  FoodLogsCompanion toCompanion({bool nullToAbsent = true}) {
    return FoodLogsCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      food: Value(foods.join(",")),
      imagePath: imagePath != null ? Value(imagePath!) : const Value.absent(),
      createdAt: createdAt != null
          ? Value(createdAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
      updatedAt: updatedAt != null
          ? Value(updatedAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
    );
  }

  static FoodLogEntity fromData(FoodLog data) {
    return FoodLogEntity(
      id: data.id,
      foods: data.food.split(","),
      imagePath: data.imagePath,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }
}
