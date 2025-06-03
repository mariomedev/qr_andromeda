import 'package:go_router/go_router.dart';

import '../../features/screens.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/generate_qr',
      builder: (context, state) => const GenerateQrScreen(),
      routes: [
        GoRoute(
          path: '/text_code',
          builder: (context, state) => const TextGenerateCode(),
        ),
        GoRoute(
          path: '/web_code',
          builder: (context, state) => const WebSideGenerateCode(),
        ),
        GoRoute(
          path: '/wifi',
          builder: (context, state) => const WifiGenerateCode(),
        ),
        GoRoute(
          path: '/event',
          builder: (context, state) => const EventGenerateCode(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactGenerateCode(),
        ),
        GoRoute(
          path: '/business',
          builder: (context, state) => const BusinessGenerateCode(),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
