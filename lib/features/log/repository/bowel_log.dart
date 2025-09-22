import 'package:life_track/features/log/domain/irepository/bowel_log.dart';
import 'package:life_track/database/daos/bowel_log.dart';
import 'package:life_track/database/app_database.dart';
import 'package:life_track/features/log/domain/entities/bowel_log.dart';
import 'package:drift/drift.dart';

class BowelLogRepository implements IBowelLogRepository {
  final BowelLogDao _dao;

  BowelLogRepository(this._dao);

  @override
  Future<void> insert(BowelLogEntity bowelLog) async {
    final entry = bowelLog.toCompanion();
    await _dao.insertRecord(entry);
    return;
  }

  @override
  Future<void> update(BowelLogEntity bowelLog) async {
    final entry = bowelLog.toCompanion();
    await _dao.updateRecord(entry);
    return;
  }

  @override
  Future<void> delete(int id) async {
    final entry = BowelLogsCompanion(id: Value(id));
    await _dao.deleteRecord(entry);
    return;
  }

  @override
  Future<BowelLogEntity?> get(int id) async {
    final entry = await _dao.getRecordById((T) => T.id.equals(id));
    if (entry == null) {
      return null;
    }
    final entity = BowelLogEntity.fromData(entry);
    return entity;
  }

  @override
  Future<List<BowelLogEntity>> list() async {
    final entries = await _dao.getAllRecords();
    final entities = [
      for (var entry in entries) BowelLogEntity.fromData(entry)
    ];
    return entities;
  }
}
