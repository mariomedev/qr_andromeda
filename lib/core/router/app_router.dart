import 'package:go_router/go_router.dart';

import '../../features/screens.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/generate_qr',
      builder: (context, state) => const GenerateQrScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const GenerateCodeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
