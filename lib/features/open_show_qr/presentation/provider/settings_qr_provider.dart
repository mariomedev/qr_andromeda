import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

final settingsQrProvider = StateProvider<PrettyQrDecoration>((ref) {
  final decoration = const PrettyQrDecoration(
    shape: PrettyQrSmoothSymbol(
      color: Colors.black,
    ),
    image: PrettyQrDecorationImage(
      image: AssetImage('assets/img/icon.png'),
      position: PrettyQrDecorationImagePosition.embedded,
    ),
    background: Colors.transparent,
    quietZone: PrettyQrQuietZone.zero,
  );

  return decoration;
});
