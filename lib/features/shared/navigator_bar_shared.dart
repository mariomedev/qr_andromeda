import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:qr_andromeda/core/core.dart';

class NavigationBarShared extends StatefulWidget {
  const NavigationBarShared({super.key});

  @override
  State<NavigationBarShared> createState() => _NavigationBarSharedState();
}

class _NavigationBarSharedState extends State<NavigationBarShared> {
  int _pageSeleted = 0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      margin: const EdgeInsets.only(
        left: AppDimensions.kMargin30,
        bottom: AppDimensions.kMargin25,
        right: AppDimensions.kMargin30,
        top: 0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: NavigationBar(
          backgroundColor: colors.onPrimaryContainer,
          destinations: [
            _ItemCustom(
              title: 'Generate',
              pathImage: AppAssets.qrNavigatorBar,
              isSelected: _pageSeleted == 0 ? true : false,
              onTap: () {
                _pageSeleted = 0;
                context.go('/generate_qr');
              },
            ),
            _ItemCustom(
              title: 'History',
              pathImage: AppAssets.historyNavigatorBar,
              isSelected: _pageSeleted == 1 ? true : false,
              onTap: () {
                _pageSeleted = 1;

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCustom extends StatefulWidget {
  final String title;
  final String pathImage;
  final bool isSelected;
  final void Function()? onTap;

  const _ItemCustom({
    required this.title,
    required this.pathImage,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<_ItemCustom> createState() => _ItemCustomState();
}

class _ItemCustomState extends State<_ItemCustom> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      splashColor: colors.primary.withValues(alpha: 0.3),
      onTap: widget.onTap,
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            widget.pathImage,
            colorFilter: ColorFilter.mode(
              widget.isSelected ? colors.primary : Colors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? colors.primary : Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            height: 5,
            width: 50,
            color: widget.isSelected ? colors.primary : Colors.white,
          ),
        ],
      ),
    );
  }
}
