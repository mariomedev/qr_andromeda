import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrImpl extends StatefulWidget {
  /// Constructor for simple Mobile Scanner example
  const QrImpl({super.key});

  @override
  State<QrImpl> createState() => _QrImplState();
}

class _QrImplState extends State<QrImpl> {
  Barcode? _barcode;

  Widget _barcodePreview(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(onDetect: _handleBarcode),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: Center(child: _barcodePreview(_barcode)),
            ),
          ),
        ],
      ),
    );
  }
}
