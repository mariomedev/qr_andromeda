import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../settings/presentation/provider/providers.dart';
import '../provider/providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _initialConfiguration();
    _checkOnboardingStatus();
    super.initState();
  }

  Future<void> _initialConfiguration() async {
    _themeData();
  }

  Future<void> _themeData() async {
    final settings = ref.read(settingProvider);
    final colorTheme = await settings.getThemeColor(
      SharedPrefesKeys.colorTheme,
    );
    final isDarkMode = await settings.getIsDarkMode(
      SharedPrefesKeys.isDarkMode,
    );
    ref.read(themeColorProvider.notifier).state = colorTheme;
    ref.read(isDarkModeProvider.notifier).state = isDarkMode;
  }

  Future<void> _checkOnboardingStatus() async {
    final bool? status = await ref
        .read(onbordingProvider)
        .getStatusOnboarding(SharedPrefesKeys.hasCompletedOnboarding);

    if (status == true) {
      if (mounted) context.push('/home');
    } else {
      if (mounted) context.push('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
