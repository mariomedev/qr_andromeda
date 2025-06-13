import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

abstract class QRRepo {
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  });
  Future<void> deleteQRData({required int id});
}
