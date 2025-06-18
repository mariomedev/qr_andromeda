import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/shared.dart';
import '../provider/qr_provider_scan.dart';
import 'widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qr = ref.watch(qrProviderScan);
    return Stack(
      children: [
        const QrImpl(),
        const SafeArea(
          child: Scaffold(
            appBar: AppBarHome(),
            bottomNavigationBar: NavigationBarShared(),
            floatingActionButton: FloatingActionButtonShared(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            backgroundColor: Colors.transparent,
          ),
        ),
        if (qr.displayValue != null)
          CardQrRead(
            label: 'Detected type: ${qr.type.name.toUpperCase()}',
            data: qr.displayValue!,
            type: qr.type.name.toUpperCase(),
          ),
      ],
    );
  }
}
