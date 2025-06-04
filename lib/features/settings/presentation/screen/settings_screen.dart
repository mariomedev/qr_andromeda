import 'package:flutter/material.dart';

import 'package:qr_andromeda/core/constants/constants.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCodeGenerate(
        title: 'Settings',
      ),
      body: _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding20,
        vertical: AppDimensions.kPadding20,
      ),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 26,
              color: colors.primary,
            ),
          ),
          CardSettings(
            title: 'Vibrate',
            subtitle: 'Vibration when scan is done.',
            pathIcon: AppAssets.vibrateIcon,
          ),
          CardSettings(
            title: 'Beep',
            subtitle: 'Beep when scan is done.',
            pathIcon: AppAssets.beepIcon,
          ),
          Text(
            'Support',
            style: TextStyle(
              fontSize: 26,
              color: colors.primary,
            ),
          ),
          CardSettings(
            title: 'Rate Us',
            subtitle: 'Your best reward to us.',
            pathIcon: AppAssets.rateIcon,
          ),
          CardSettings(
            title: 'Share',
            subtitle: 'Share app with others.',
            pathIcon: AppAssets.shareIcon,
          ),
          CardSettings(
            title: 'Privacy Policy',
            subtitle: 'Follow our policies that benefits you.',
            pathIcon: AppAssets.privacyIcon,
          ),
        ],
      ),
    );
  }
}
