import '../../../open_show_qr/domain/entities/qr_entity.dart';

abstract class QRDataHistory {
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  });
  Future<bool?> deleteQRData({required int id});
}
