import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../provider/qr_provider_scan.dart';
import 'widgets.dart';

class QrImpl extends ConsumerWidget {
  const QrImpl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodes) {
              ref.read(qrProviderScan.notifier).state =
                  barcodes.barcodes.firstOrNull ?? const Barcode();
            },
          ),
          const Align(
            alignment: Alignment.center,
            child: ContainerScan(),
          ),
          Align(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
