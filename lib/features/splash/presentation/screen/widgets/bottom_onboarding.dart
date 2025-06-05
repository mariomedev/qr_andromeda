import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../provider/providers.dart';

class BottomOnboarding extends ConsumerWidget {
  const BottomOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: size.height * 0.18,
      width: double.infinity,
      child: CustomPaint(
        painter: _Painter(color: colors),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              Positioned(
                bottom: size.height * 0.04,
                right: size.width * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(onbordingProvider)
                        .saveStatusOnboarding(
                          SharedPrefesKeys.hasCompletedOnboarding,
                          true,
                        );
                    context.push('/home');
                  },

                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(
                      AppDimensions.kPadding20,
                    ),
                    elevation: 5,
                    backgroundColor: colors.primary,
                    iconColor: colors.onPrimaryContainer,
                    shadowColor: colors.primary,
                  ),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final ColorScheme color;

  _Painter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.onSecondaryContainer
      ..strokeWidth = 50;

    final path = Path();
    path.moveTo(size.width * .2, size.height);
    path.quadraticBezierTo(
      size.width * 2.5 / 5,
      size.height * 1 / 5,
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
