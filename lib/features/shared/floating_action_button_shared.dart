import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_andromeda/core/constants/storage/app_assets.dart';

class FloatingActionButtonShared extends StatelessWidget {
  const FloatingActionButtonShared({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 30, color: colors.primary)],
      ),
      child: FloatingActionButton(
        backgroundColor: colors.primary,
        shape: CircleBorder(),
        onPressed: () {},
        child: SvgPicture.asset(
          AppAssets.qrScan,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
