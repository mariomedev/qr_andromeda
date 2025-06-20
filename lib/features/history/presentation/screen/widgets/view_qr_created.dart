import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import 'widgets.dart';

class ViewQrCreated extends ConsumerWidget {
  const ViewQrCreated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCreateQR = ref.watch(historyProvider).qrListCreated;
    if (listCreateQR.isEmpty) {
      return const HistoryDataEmpty(title: 'Create Qr Now');
    }
    return ListView.builder(
      itemCount: listCreateQR.length,
      itemBuilder: (context, index) {
        final qr = listCreateQR[index];
        return CardHistory(
          qr: qr,
        );
      },
    );
  }
}
