import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastruture/infrastruture.dart';

final qrRepositoryProvider = Provider<QRRepo>((ref) {
  return QrRepoImpl(dataSource: QrDataIsarImpl());
});
