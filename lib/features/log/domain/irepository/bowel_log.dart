import 'package:life_track/features/log/domain/entities/bowel_log.dart';

abstract class IBowelLogRepository {
  Future<void> insert(BowelLogEntity bowelLog);
  Future<void> update(BowelLogEntity bowelLog);
  Future<void> delete(int id);
  Future<BowelLogEntity?> get(int id);
  Future<List<BowelLogEntity>> list();
}
