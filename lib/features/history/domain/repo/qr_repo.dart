import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

abstract class QRRepoHistory {
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  });
  Future<bool?> deleteQRData({required int id});
}
