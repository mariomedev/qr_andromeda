import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import 'qr_repository.dart';

final qrProvider = Provider<QrNotifier>((ref) {
  final qrRepository = ref.watch(qrRepositoryProvider);
  return QrNotifier(qrRepository);
});

class QrNotifier {
  final QRRepo qrRepo;
  QrNotifier(this.qrRepo);

  Future<int> saveQRData({required QREntity data}) async {
    return await qrRepo.saveQRData(data: data);
  }

  Future<QREntity?> getQrById({required int id}) async {
    return await qrRepo.getQrById(id: id);
  }

  Future<bool> updateQrData({
    required int id,
    required QREntity data,
  }) async {
    return await qrRepo.updateQrData(id: id, data: data);
  }
}
