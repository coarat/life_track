import 'package:life_track/features/log/domain/irepository/food_log.dart';
import 'package:life_track/database/daos/food_log.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/features/log/domain/entities/food_log.dart';
import 'package:drift/drift.dart';

class FoodLogRepository implements IFoodLogRepository {
  final FoodLogDao _dao;

  FoodLogRepository(this._dao);

  @override
  Future<void> insert(FoodLogEntity foodLog) async {
    final entry = foodLog.toCompanion();
    await _dao.insertRecord(entry);
    return;
  }

  @override
  Future<void> update(FoodLogEntity foodLog) async {
    final entry = foodLog.toCompanion();
    await _dao.updateRecord(entry);
    return;
  }

  @override
  Future<void> delete(int id) async {
    final entry = FoodLogsCompanion(id: Value(id));
    await _dao.deleteRecord(entry);
    return;
  }

  @override
  Future<FoodLogEntity?> get(int id) async {
    final entry = await _dao.getRecordById((T) => T.id.equals(id));
    if (entry == null) {
      return null;
    }
    final entity = FoodLogEntity.fromData(entry);
    return entity;
  }

  @override
  Future<List<FoodLogEntity>> list() async {
    final entries = await _dao.getAllRecords();
    final entities = [for (var entry in entries) FoodLogEntity.fromData(entry)];
    return entities;
  }
}
