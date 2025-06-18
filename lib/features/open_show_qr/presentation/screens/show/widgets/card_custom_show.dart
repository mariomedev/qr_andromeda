import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class CardCustomShow extends StatelessWidget {
  final String data;
  final String type;

  const CardCustomShow({
    super.key,
    required this.data,
    required this.type,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
