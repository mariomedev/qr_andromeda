import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../widgets/button_open_show_qr.dart';

class ButtonBarOpen extends StatelessWidget {
  const ButtonBarOpen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimensions.kPadding30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonOpenShowQr(
          title: 'Share',
          pathImage: AppAssets.shareIcon,
          onPressed: () {},
        ),
        ButtonOpenShowQr(
          title: 'Copy',
          pathImage: AppAssets.copyOpenShowIcon,
          onPressed: () {},
        ),
      ],
    );
  }
}
