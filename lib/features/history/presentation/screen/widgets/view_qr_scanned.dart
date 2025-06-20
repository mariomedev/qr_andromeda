import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import 'widgets.dart';

class ViewQrScanned extends ConsumerWidget {
  const ViewQrScanned({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listScannedQR = ref.watch(historyProvider).qrListScanned;
    if (listScannedQR.isEmpty) {
      return const HistoryDataEmpty(title: 'Scan Qr Now');
    }
    return ListView.builder(
      itemCount: listScannedQR.length,
      itemBuilder: (context, index) {
        final qr = listScannedQR[index];
        return CardHistory(
          qr: qr,
        );
      },
    );
  }
}
