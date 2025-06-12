import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../widgets/button_open_show_qr.dart';

class ButtonBarShow extends StatelessWidget {
  final Function()? onPressedShare;
  final Function()? onPressedSave;
  const ButtonBarShow({
    super.key,
    this.onPressedShare,
    this.onPressedSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimensions.kSpacing10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonOpenShowQr(
          title: 'Share',
          pathImage: AppAssets.shareIcon,
          onPressed: onPressedShare,
        ),
        ButtonOpenShowQr(
          title: 'Save',
          pathImage: AppAssets.saveOpenShowIcon,
          onPressed: onPressedSave,
        ),
      ],
    );
  }
}
