import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/domain.dart';

import '../../../../../../core/core.dart';
import '../../widgets/button_open_show_qr.dart';

class ButtonBarShow extends ConsumerWidget {
  final QREntity? qr;
  final Function()? onPressedShare;
  final Function()? onPressedSave;
  const ButtonBarShow({
    super.key,
    this.qr,
    this.onPressedShare,
    this.onPressedSave,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onPressedLink = ref.watch(urlLauncherProvider.notifier);
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
        if (qr != null) ...[
          if (qr!.data.contains('http') || qr!.data.contains('https'))
            ButtonOpenShowQr(
              title: 'Link',
              pathImage: AppAssets.linkOpenShowIcon,
              onPressed: () => onPressedLink.launchLink(qr!.data),
            ),
          if (qr!.type == AppText.phoneType)
            ButtonOpenShowQr(
              title: 'Call',
              pathImage: AppAssets.phoneOpenShowIcon,
              onPressed: () => onPressedLink.makePhoneCall(qr!.data),
            ),
        ],
      ],
    );
  }
}
