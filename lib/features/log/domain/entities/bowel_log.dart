import 'package:drift/drift.dart';
import 'package:life_track/database/app_database.dart';

class BowelLogEntity {
  final int? id;
  final AmountEnum amount;
  final ColorEnum color;
  final ShapeEnum shape;
  final ThicknessEnum thickness;
  final SmellEnum smell;
  final String? memo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BowelLogEntity({
    this.id,
    required this.amount,
    required this.color,
    required this.shape,
    required this.thickness,
    required this.smell,
    this.memo,
    this.createdAt,
    this.updatedAt,
  });

  BowelLogsCompanion toCompanion({bool nullToAbsent = true}) {
    return BowelLogsCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      amount: Value(amount.code),
      color: Value(color.code),
      shape: Value(shape.code),
      thickness: Value(thickness.code),
      smell: Value(smell.code),
      memo: memo != null ? Value(memo!) : const Value.absent(),
      createdAt: createdAt != null
          ? Value(createdAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
      updatedAt: updatedAt != null
          ? Value(updatedAt!)
          : (nullToAbsent ? const Value.absent() : Value(DateTime.now())),
    );
  }

  static BowelLogEntity fromData(BowelLog data) {
    return BowelLogEntity(
      id: data.id,
      amount: AmountEnum.fromCode(data.amount),
      color: ColorEnum.fromCode(data.color),
      shape: ShapeEnum.fromCode(data.shape),
      thickness: ThicknessEnum.fromCode(data.thickness),
      smell: SmellEnum.fromCode(data.smell),
      memo: data.memo,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }
}

enum AmountEnum {
  fifty(0, "50g"),
  oneHundred(1, "100g"),
  oneHundredFifty(2, "150g"),
  twoHundred(3, "200g"),
  twoHundredFifty(4, "250g");

  final int code;
  final String label;

  const AmountEnum(this.code, this.label);

  static AmountEnum fromCode(int code) {
    return AmountEnum.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError("Invalid code: $code"),
    );
  }
}

enum ColorEnum {
  white(0, "白"),
  yellow(1, "黄"),
  orange(2, "オレンジ"),
  yellowBrown(3, "薄茶"),
  brown(4, "茶"),
  darkBrown(5, "焦茶"),
  black(6, "黒"),
  green(7, "緑"),
  red(7, "赤");

  final int code;
  final String label;

  const ColorEnum(this.code, this.label);

  static ColorEnum fromCode(int code) {
    return ColorEnum.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError("Invalid code: $code"),
    );
  }
}

enum ShapeEnum {
  grain(0, "粒々"),
  veryHard(1, "とても硬い"),
  hard(2, "硬い"),
  normal(3, "普通"),
  soft(4, "柔らかい"),
  verySoft(5, "とても柔らかい"),
  liquid(6, "液状");

  final int code;
  final String label;

  const ShapeEnum(this.code, this.label);

  static ShapeEnum fromCode(int code) {
    return ShapeEnum.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError("Invalid code: $code"),
    );
  }
}

enum ThicknessEnum {
  veryThin(0, "とても細い"),
  thin(1, "細い"),
  normal(2, "普通"),
  thick(3, "太い"),
  veryThick(4, "とても太い"),
  noTickness(5, "当てはまらない");

  final int code;
  final String label;

  const ThicknessEnum(this.code, this.label);

  static ThicknessEnum fromCode(int code) {
    return ThicknessEnum.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError("Invalid code: $code"),
    );
  }
}

enum SmellEnum {
  noSmell(0, "匂わない"),
  smell(1, "匂う"),
  badSmell(2, "とても匂う");

  final int code;
  final String label;

  const SmellEnum(this.code, this.label);

  static SmellEnum fromCode(int code) {
    return SmellEnum.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError("Invalid code: $code"),
    );
  }
}
