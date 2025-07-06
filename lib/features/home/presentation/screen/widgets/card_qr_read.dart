import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/domain.dart';

import '../../../../../core/core.dart';

class CardQrRead extends StatelessWidget {
  const CardQrRead({
    super.key,
    required this.label,
    required this.data,
    required this.type,
  });

  final String label;
  final String data;
  final String type;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final qr = QREntity.fromDecoration(
      data: data,
      isFromScan: true,
      type: type,
      decoration: const PrettyQrDecoration(),
    );
    return GestureDetector(
      onTap: () async {
        context.push(
          '/show_qr',
          extra: qr,
        );
      },
      child: TweenAnimationBuilder<double>(
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        duration: const Duration(milliseconds: 700),
        tween: Tween(begin: 0.0, end: 1.0),
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
                          data,
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
      ),
    );
  }
}
