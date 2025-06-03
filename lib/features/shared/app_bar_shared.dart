import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class AppBarShared extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarShared({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      title: Text(title),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
      actions: [
        SizedBox(
          height: 40,
          width: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.onSecondaryContainer,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.kBorderRadius6,
                ),
              ),
            ),
            onPressed: () {
              context.push('/settings');
            },
            child: const Icon(Icons.menu_open_sharp),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
