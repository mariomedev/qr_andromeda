import '../../../open_show_qr/domain/domain.dart';
import '../../domain/domain.dart';

class RepoHistoryImpl implements QRRepoHistory {
  final QRDataHistory dataSource;

  RepoHistoryImpl({required this.dataSource});

  @override
  Future<bool?> deleteQRData({required int id}) async {
    return await dataSource.deleteQRData(id: id);
  }

  @override
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  }) async {
    return await dataSource.getListQrData(offset: offset, limit: limit);
  }
}
