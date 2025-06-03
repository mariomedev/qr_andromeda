import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';

class BoxCodeGenerate extends StatelessWidget {
  final String title;
  final String iconSvg;
  final List<Widget> children;
  const BoxCodeGenerate({
    super.key,
    required this.title,
    required this.iconSvg,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kMargin25,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kPadding10,
          vertical: AppDimensions.kPadding10,
        ),
        decoration: BoxDecoration(
          color: colors.onTertiaryContainer,
          borderRadius: BorderRadius.circular(
            AppDimensions.kBorderRadius6,
          ),
          border: Border.symmetric(
            horizontal: BorderSide(
              color: colors.primary,
              width: 2,
            ),
          ),
        ),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 1),
            Hero(
              tag: iconSvg,
              child: SvgPicture.asset(
                iconSvg,
                colorFilter: ColorFilter.mode(
                  colors.primary,
                  BlendMode.srcIn,
                ),
                height: 60,
                width: 60,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: children,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Generate QR code'),
            ),
          ],
        ),
      ),
    );
  }
}
