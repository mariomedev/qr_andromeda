import 'package:flutter/material.dart';

import 'widgets/view_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ViewOnboarding(),
    );
  }
}
