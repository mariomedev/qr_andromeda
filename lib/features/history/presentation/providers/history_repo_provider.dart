import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../infrastruture/infrastruture.dart';

final histoyRepoProvider = Provider<QRRepoHistory>((ref) {
  return RepoHistoryImpl(dataSource: DataHistoryIsar());
});
