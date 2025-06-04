import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';

class ButtonOpenShowQr extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String pathImage;
  const ButtonOpenShowQr({
    super.key,
    required this.title,
    required this.onPressed,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      spacing: AppDimensions.kSpacing10,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimaryFixed,
            elevation: 5,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.kPadding10,
              vertical: AppDimensions.kPadding20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(
                AppDimensions.kBorderRadius6,
              ),
            ),
          ),
          child: SvgPicture.asset(
            pathImage,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              colors.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
