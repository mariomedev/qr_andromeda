import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

import '../../domain/domain.dart';

class DataHistoryIsar implements QRDataHistory {
  late final Future<Isar> _isarInstance;
  DataHistoryIsar() {
    _isarInstance = openIsar();
  }

  Future<Isar> openIsar() async {
    final dir = await getApplicationCacheDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          QREntitySchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool?> deleteQRData({required int id}) async {
    final isar = await _isarInstance;
    final result = await isar.writeTxn(
      () async {
        return await isar.qREntitys.delete(id);
      },
    );

    return result;
  }

  @override
  Future<List<QREntity>> getListQrData({
    required int offset,
    required int limit,
  }) async {
    final isar = await _isarInstance;
    final result = await isar.qREntitys
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
    return result;
  }
}
