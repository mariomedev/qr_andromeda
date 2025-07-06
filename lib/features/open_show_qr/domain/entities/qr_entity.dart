import 'package:isar/isar.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../infrastruture/infrastruture.dart';

part 'qr_entity.g.dart';

@collection
class QREntity {
  Id id = Isar.autoIncrement;
  final String data;
  final String type;
  final bool isFromScan;
  late String decorationJson;
  DateTime? createdAt;
  DateTime? updated;

  QREntity({
    required this.data,
    required this.type,
    required this.isFromScan,
    required this.decorationJson,
    this.createdAt,
    this.updated,
  });

  @ignore
  PrettyQrDecoration get decoration =>
      PrettyQrDecorationMapper.decode(decorationJson);

  set decoration(PrettyQrDecoration d) =>
      decorationJson = PrettyQrDecorationMapper.encode(d);

  factory QREntity.fromDecoration({
    required String data,
    required String type,
    required bool isFromScan,
    required PrettyQrDecoration decoration,
  }) {
    return QREntity(
      data: data,
      type: type,
      isFromScan: isFromScan,
      decorationJson: PrettyQrDecorationMapper.encode(decoration),
    );
  }
}
