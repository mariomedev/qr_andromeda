import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final qrProviderScan = StateProvider<Barcode>((ref) {
  return const Barcode();
});
