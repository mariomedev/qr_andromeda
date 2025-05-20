import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class FloatingActionButtonShared extends StatelessWidget {
  const FloatingActionButtonShared({super.key});

  @override
  Widget build(BuildContext context) {
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
