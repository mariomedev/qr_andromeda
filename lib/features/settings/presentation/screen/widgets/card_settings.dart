import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';

class CardSettings extends StatelessWidget {
  final void Function()? onTap;
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
    this.onTap,
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
        border: Border(
          bottom: BorderSide(
            color: colors.primary,
            width: 2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.brightness == Brightness.light
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
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
