import 'package:life_track/features/log/domain/entities/food_log.dart';

abstract class IFoodLogRepository {
  Future<void> insert(FoodLogEntity foodLog);
  Future<void> update(FoodLogEntity foodLog);
  Future<void> delete(int id);
  Future<FoodLogEntity?> get(int id);
  Future<List<FoodLogEntity>> list();
}
