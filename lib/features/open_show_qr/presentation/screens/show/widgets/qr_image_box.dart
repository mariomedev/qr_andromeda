import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../../../core/core.dart';

class QrImageBox extends StatelessWidget {
  final QrImage image;
  final PrettyQrDecoration decoration;

  const QrImageBox({super.key, required this.image, required this.decoration});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(AppDimensions.kBorderRadius6),
      color: colors.primary.withValues(alpha: 0.3),
      child: PrettyQrView(
        qrImage: image,
        decoration: decoration,
      ),
    );
  }
}
