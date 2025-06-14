import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Row(
        spacing: 20,
        children: [
          Container(
            margin: const EdgeInsets.only(left: AppDimensions.kMargin20),
            decoration: BoxDecoration(
              color: colors.onPrimaryContainer,
              borderRadius: BorderRadius.circular(AppDimensions.kBorderRadius6),
              boxShadow: [
                BoxShadow(
                  color: colors.brightness == Brightness.light
                      ? Colors.black.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: colors.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 55);
}
