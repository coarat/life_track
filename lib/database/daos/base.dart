import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';

abstract class BaseDao<T extends Table, D>
    extends DatabaseAccessor<AppDatabase> {
  final AppDatabase db;
  final TableInfo<T, D> table;

  BaseDao(this.db, this.table) : super(db);

  Future<int> insertRecord(Insertable<D> entry) {
    final now = DateTime.now();

    final updatedEntry = _applyTimestamps(
      entry,
      createdAt: now,
      updatedAt: now,
    );

    return db.into(table).insert(updatedEntry);
  }

  Future<bool> updateRecord(Insertable<D> entry) {
    final now = DateTime.now();

    final updatedEntry = _applyTimestamps(
      entry,
      updatedAt: now,
    );

    return db.update(table).replace(updatedEntry);
  }

  Future<int> deleteRecord(Insertable<D> entry) =>
      db.delete(table).delete(entry);

  Future<List<D>> getAllRecords() {
    return db.select(table).get();
  }

  Future<D?> getRecordById(Expression<bool> Function(T) filter) {
    return (db.select(table)..where(filter)).getSingleOrNull();
  }

  Stream<List<D>> watchAllRecords() {
    return db.select(table).watch();
  }

  Stream<D?> watchRecordById(Expression<bool> Function(T) filter) {
    return (db.select(table)..where(filter)).watchSingleOrNull();
  }

  Future<D?> getSingleOrNullRecord() {
    return db.select(table).getSingleOrNull();
  }

  Insertable<D> _applyTimestamps(
    Insertable<D> entry, {
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    // Companion に createdAt/updatedAt がある前提で dynamic にマージする
    if (entry is UpdateCompanion) {
      final map = entry.toColumns(false);

      return RawValuesInsertable<D>({
        ...map,
        if (createdAt != null) 'created_at': Variable(createdAt),
        if (updatedAt != null) 'updated_at': Variable(updatedAt),
      });
    }
    return entry;
  }
}
