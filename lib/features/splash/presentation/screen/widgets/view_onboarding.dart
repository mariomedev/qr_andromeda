import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import 'widgets.dart';

class ViewOnboarding extends StatelessWidget {
  const ViewOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Column(
      spacing: AppDimensions.kSpacing30,
      children: [
        SizedBox(
          height: size.height * 0.2,
          width: double.infinity,
          child: CustomPaint(
            painter: _Painter(color: colors),
          ),
        ),
        SizedBox(
          height: size.height * 0.2,
          child: Image.asset(
            AppAssets.iconQrAndromeda,
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
          child: const FittedBox(
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.kPadding30,
            ),
            child: Text(
              'Go and enjoy our features for free and make your life easy with us.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Spacer(),

        const BottomOnboarding(),
      ],
    );
  }
}

class _Painter extends CustomPainter {
  final ColorScheme color;

  _Painter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.brightness == Brightness.dark
          ? color.onSecondaryContainer
          : color.primary
      ..strokeWidth = 50;

    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 1 / 5,
      size.height * 5 / 5,
      size.width * 1.5 / 5,
      size.height * 3 / 5,
    );
    path.quadraticBezierTo(
      size.width * 2 / 5,
      size.height * 1 / 5,
      size.width * 3 / 5,
      size.height * 1 / 5,
    );
    path.quadraticBezierTo(
      size.width * 4 / 5,
      size.height * 1 / 5,
      size.width,
      size.height * 3 / 5,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
