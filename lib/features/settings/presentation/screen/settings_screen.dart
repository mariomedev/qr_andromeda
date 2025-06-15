import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qr_andromeda/core/constants/constants.dart';
import '../../../shared/shared.dart';
import '../provider/providers.dart';
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

class _SettingsView extends ConsumerWidget {
  const _SettingsView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding20,
        vertical: AppDimensions.kPadding20,
      ),
      child: SingleChildScrollView(
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
              title: 'Theme Color',
              subtitle: 'Change the theme color of the app.',
              pathIcon: AppAssets.vibrateIcon,
              onTap: () => chageColor(context, ref),
            ),
            CardSettings(
              title: isDarkMode ? 'Mode Dark' : 'Mode Light',
              subtitle: 'Change the app to dark mode.',
              pathIcon: AppAssets.beepIcon,
              onTap: () {
                ref
                    .read(isDarkModeProvider.notifier)
                    .update((state) => !isDarkMode);
                ref
                    .read(settingProvider)
                    .setIsDarkMode(SharedPrefesKeys.isDarkMode, !isDarkMode);
              },
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
      ),
    );
  }

  void chageColor(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(500),
              bottom: Radius.circular(100),
            ),
          ),
          content: SingleChildScrollView(
            child: HueRingPicker(
              onColorChanged: (value) {
                ref
                    .read(themeColorProvider.notifier)
                    .update(
                      (state) => value,
                    );
                ref
                    .read(settingProvider)
                    .setThemeColor(SharedPrefesKeys.colorTheme, value);
              },
              pickerColor: ref.read(themeColorProvider),
            ),
          ),
        );
      },
    );
  }
}
