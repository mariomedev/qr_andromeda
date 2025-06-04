import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class QrViewShow extends StatelessWidget {
  const QrViewShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
        border: BoxBorder.all(
          color: colors.primary,
        ),
      ),
    );
  }
}
