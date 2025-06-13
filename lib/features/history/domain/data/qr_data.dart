import '../../../open_show_qr/domain/entities/qr_entity.dart';

abstract class QRData {
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  });
  Future<void> deleteQRData({required int id});
}
