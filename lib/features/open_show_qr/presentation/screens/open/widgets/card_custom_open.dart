import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/core.dart';

class CardCustomOpen extends StatelessWidget {
  const CardCustomOpen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kMargin20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding30,
        vertical: AppDimensions.kPadding20,
      ),
      child: Column(
        spacing: AppDimensions.kSpacing10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: AppDimensions.kSpacing10,
            children: [
              SvgPicture.asset(
                AppAssets.qrScan,
                colorFilter: ColorFilter.mode(
                  colors.primary,
                  BlendMode.srcIn,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppDimensions.kSpacing10,
                children: [
                  Text('Data'),
                  Text('16 Dec 2022, 9:30 pm'),
                ],
              ),
            ],
          ),
          const Divider(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('https://www.youtube.com/watch?v=Zd9g7sKvgIM'),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Show QR Code',
              style: TextStyle(
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
