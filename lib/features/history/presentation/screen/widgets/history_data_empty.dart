import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../shared/providers/navigator_provider.dart';

class HistoryDataEmpty extends ConsumerWidget {
  final String title;

  const HistoryDataEmpty({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),

      tween: Tween(begin: 0.5, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppDimensions.kSpacing10,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 45),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
            ),
            onPressed: () {
              if (title != 'Scan Qr Now') {
                ref.read(navigatorProvider.notifier).update((state) => 0);
                context.go('/generate_qr');
              } else {
                ref.read(navigatorProvider.notifier).update((state) => 5);
                context.go('/home');
              }
            },
            child: Text(
              'Go....',
              style: TextStyle(
                fontSize: 19,
                color: colors.brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
