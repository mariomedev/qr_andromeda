import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class AppBarCodeGenerate extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const AppBarCodeGenerate({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      title: Text(title),
      leadingWidth: 70,
      leading: Row(
        children: [
          const SizedBox(
            width: AppDimensions.kMargin10,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                backgroundColor: colors.onPrimaryContainer,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.kBorderRadius6,
                  ),
                ),
              ),
              onPressed: () {
                context.pop();
              },
              child: SvgPicture.asset(
                AppAssets.arrowBigLeftLines,
                colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
