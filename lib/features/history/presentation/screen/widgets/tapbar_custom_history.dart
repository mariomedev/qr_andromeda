import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class TapbarCustomHistory extends StatelessWidget
    implements PreferredSizeWidget {
  const TapbarCustomHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: AppDimensions.kPadding10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding5,
        vertical: AppDimensions.kPadding5,
      ),
      decoration: BoxDecoration(
        color: colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.brightness == Brightness.light
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.transparent,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colors.primary,
          borderRadius: BorderRadius.circular(
            AppDimensions.kBorderRadius6,
          ),
        ),
        tabs: <Widget>[
          const Tab(
            child: Text(
              'Scan',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          const Tab(
            child: Text(
              'Create',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 60);
}
