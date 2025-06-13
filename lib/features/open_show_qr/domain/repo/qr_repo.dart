import '../domain.dart';

abstract class QRRepo {
  Future<QREntity?> getQrById({required int id});
  Future<int> saveQRData({required QREntity data});
  Future<bool> updateQrData({
    required int id,
    required QREntity data,
  });
}
