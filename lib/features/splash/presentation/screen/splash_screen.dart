import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../provider/providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _checkOnboardingStatus();
    super.initState();
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
