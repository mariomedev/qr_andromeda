import 'package:flutter/material.dart';

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
      icon: Icons.qr_code_scanner,
    );
  }
}

class _BuildItem extends StatelessWidget {
  const _BuildItem({
    required this.context,
    required this.label,
    required this.subtitle,
    required this.page,
    required this.icon,
  });

  final BuildContext context;
  final String label;
  final String subtitle;
  final Widget page;
  final IconData icon;

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
              children: [
                Icon(icon, size: 40, color: colors.primary),
                const SizedBox(width: 20),
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
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
