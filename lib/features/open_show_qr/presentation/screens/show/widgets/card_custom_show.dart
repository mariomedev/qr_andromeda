import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class CardCustomShow extends StatelessWidget {
  const CardCustomShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kMargin20,
        vertical: AppDimensions.kMargin20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding20,
        vertical: AppDimensions.kPadding20,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data',
            style: TextStyle(fontSize: 18),
          ),
          Text('https://www.youtube.com/watch?v=Zd9g7sKvgIM'),
        ],
      ),
    );
  }
}
