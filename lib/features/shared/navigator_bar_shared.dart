import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:qr_andromeda/core/core.dart';
import 'package:qr_andromeda/features/shared/providers/navigator_provider.dart';

class NavigationBarShared extends ConsumerWidget {
  const NavigationBarShared({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final handleNavigator = ref.watch(navigatorProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
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
              isSelected: handleNavigator == 0 ? true : false,
              onTap: () {
                ref.read(navigatorProvider.notifier).update((state) => 0);
                context.go('/generate_qr');
              },
            ),
            _ItemCustom(
              title: 'History',
              pathImage: AppAssets.historyNavigatorBar,
              isSelected: handleNavigator == 1 ? true : false,
              onTap: () {
                ref.read(navigatorProvider.notifier).update((state) => 1);
                context.go('/history');
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
    final colorButton = colors.brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return InkWell(
      splashColor: colors.primary.withValues(alpha: 0.3),
      onTap: widget.onTap,
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            widget.pathImage,
            colorFilter: ColorFilter.mode(
              widget.isSelected ? colors.primary : colorButton,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? colors.primary : colorButton,
            ),
          ),
          const Spacer(),
          Container(
            height: 5,
            width: 50,
            color: widget.isSelected ? colors.primary : colorButton,
          ),
        ],
      ),
    );
  }
}
