import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'qr_entity.g.dart';

@collection
class QREntity {
  Id id = Isar.autoIncrement;
  final String data;
  final String type;
  final bool isFromScan;
  late int colorValue;
  late int zone;
  DateTime? createdAt;
  DateTime? updated;

  QREntity({
    required this.data,
    required this.isFromScan,
    required this.type,
    this.zone = 0,
    this.colorValue = 0,
    this.updated,
    this.createdAt,
  });

  @ignore
  Color get color => Color(colorValue);

  set color(Color c) => colorValue = c.toARGB32();
}
