import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';

class CardSettings extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pathIcon;
  final Widget? traniling;
  const CardSettings({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pathIcon,
    this.traniling,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: colors.onTertiaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),

        border: Border(
          bottom: BorderSide(
            color: colors.primary,
            width: 2,
          ),
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          pathIcon,
          colorFilter: ColorFilter.mode(
            colors.primary,
            BlendMode.srcIn,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: traniling,
      ),
    );
  }
}
