import 'package:qr_andromeda/features/open_show_qr/domain/data/qr_data.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

import '../../domain/repo/qr_repo.dart';

class QrRepoImpl implements QRRepo {
  final QRData dataSource;
  QrRepoImpl({required this.dataSource});

  @override
  Future<QREntity?> getQrById({required int id}) async {
    return await dataSource.getQrById(id: id);
  }

  @override
  Future<int> saveQRData({required QREntity data}) async {
    return await dataSource.saveQRData(data: data);
  }

  @override
  Future<bool> updateQrData({required int id, required QREntity data}) async {
    return await dataSource.updateQrData(id: id, data: data);
  }
}

 /*  @override
  Future<void> deleteQRData({required int id}) async {
    return dataSource.deleteQRData(id: id);
  }

  @override
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  }) {
    return dataSource.getListQrData(offset: offset, limit: limit);
  }
 */