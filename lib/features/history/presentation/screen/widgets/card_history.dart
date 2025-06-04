import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_andromeda/core/constants/constants.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.onPrimaryContainer,
      child: ListTile(
        leading: SvgPicture.asset(
          AppAssets.qrScan,
          colorFilter: ColorFilter.mode(
            colors.primary,
            BlendMode.srcIn,
          ),
        ),
        title: const Text('https://itunes.com'),
        subtitle: const Text('Data'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              AppAssets.deleteIcon,
              colorFilter: ColorFilter.mode(
                colors.primary,
                BlendMode.srcIn,
              ),
            ),
            const Text('16 Dec 2022, 9:30 pm'),
          ],
        ),
      ),
    );
  }
}
