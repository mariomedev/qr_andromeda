import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';
import 'widgets.dart';

class CardQrRead extends StatelessWidget {
  const CardQrRead({super.key});

  @override
  Widget build(BuildContext context) {
    return _BuildItem(
      context: context,
      label: 'Simple Mobile Scanner',
      subtitle:
          'Example of a simple mobile scanner instance without defining '
          'a controller.',
      page: const QrImpl(),
    );
  }
}

class _BuildItem extends StatelessWidget {
  const _BuildItem({
    required this.context,
    required this.label,
    required this.subtitle,
    required this.page,
  });

  final BuildContext context;
  final String label;
  final String subtitle;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (context) => page));
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.fromLTRB(
          AppDimensions.kMargin30,
          AppDimensions.kMargin115,
          AppDimensions.kMargin30,
          0,
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.kBorderRadius6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: AppDimensions.kSpacing10),
                SvgPicture.asset(
                  AppAssets.qrNavigatorBar,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppDimensions.kSpacing20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: colors.primary),
                const SizedBox(width: AppDimensions.kSpacing5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
