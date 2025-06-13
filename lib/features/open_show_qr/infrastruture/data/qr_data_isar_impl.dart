import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';

class QrDataIsarImpl implements QRData {
  late final Future<Isar> _isarInstance;

  QrDataIsarImpl() {
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
  Future<QREntity?> getQrById({required int id}) async {
    final isar = await _isarInstance;
    final qr = await isar.qREntitys.get(id);
    return qr;
  }

  @override
  Future<int> saveQRData({required QREntity data}) async {
    late final int id;
    final isar = await _isarInstance;
    isar.writeTxnSync(
      () {
        final idQr = isar.qREntitys.putSync(data);
        id = idQr;
      },
    );
    return id;
  }

  @override
  Future<bool> updateQrData({required int id, required QREntity data}) {
    final isar = _isarInstance;
    return isar.then((isarInstance) async {
      final existingData = await isarInstance.qREntitys.get(id);
      if (existingData != null) {
        data.id = id;
        await isarInstance.writeTxn(() async {
          await isarInstance.qREntitys.put(data);
        });
        return true;
      }
      return false;
    });
  }
}
