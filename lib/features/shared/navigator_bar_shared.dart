import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_andromeda/core/constants/storage/app_assets.dart';
import 'package:qr_andromeda/core/core.dart';

class NavigationBarShared extends StatelessWidget {
  const NavigationBarShared({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      margin: EdgeInsets.only(
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
            _ItemCustom(title: 'Generate', pathImage: AppAssets.qrNavigatorBar),
            _ItemCustom(
              title: 'History',
              pathImage: AppAssets.historyNavigatorBar,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCustom extends StatelessWidget {
  final String title;
  final String pathImage;

  const _ItemCustom({required this.title, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      height: 67,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(pathImage),
          Text(title, style: textStyle.titleMedium!.copyWith()),
        ],
      ),
    );
  }
}
