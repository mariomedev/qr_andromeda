import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_andromeda/features/shared/providers/navigator_provider.dart';

import '../../core/core.dart';

class FloatingActionButtonShared extends ConsumerWidget {
  const FloatingActionButtonShared({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 30, color: colors.primary)],
      ),
      child: FloatingActionButton(
        backgroundColor: colors.primary,
        shape: const CircleBorder(),
        onPressed: () {
          ref.watch(navigatorProvider.notifier).update((state) => 5);
          context.go('/home');
        },
        child: SvgPicture.asset(
          AppAssets.qrScan,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
