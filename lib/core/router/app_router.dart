import 'package:go_router/go_router.dart';
import 'package:qr_andromeda/features/generete_qr/presentation/screen/generate_qr_screen.dart';
import 'package:qr_andromeda/features/home/presentation/screen/screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeSreen()),
    GoRoute(
      path: '/generate_qr',
      builder: (context, state) => const GenerateQrScreen(),
    ),
  ],
);
