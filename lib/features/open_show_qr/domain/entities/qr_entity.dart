import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'qr_entity.g.dart';

@collection
class QREntity {
  Id id = Isar.autoIncrement;
  final String data;
  late int colorValue;
  late int zone;
  DateTime? createdAt;
  DateTime? updateAt;

  QREntity({
    required this.data,
    this.zone = 0,
    this.colorValue = 0,
    this.updateAt,
    this.createdAt,
  });

  @ignore
  Color get color => Color(colorValue);

  set color(Color c) => colorValue = c.value;
}
