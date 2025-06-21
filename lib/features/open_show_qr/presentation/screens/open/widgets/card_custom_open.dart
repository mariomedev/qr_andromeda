import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../provider/providers.dart';

class CardCustomOpen extends ConsumerStatefulWidget {
  final int id;
  const CardCustomOpen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<CardCustomOpen> createState() => _CardCustomOpenState();
}

class _CardCustomOpenState extends ConsumerState<CardCustomOpen> {
  QREntity? data;

  @override
  void initState() {
    _getQrData();
    super.initState();
  }

  Future<void> _getQrData() async {
    final result = await ref.read(qrProvider).getQrById(id: widget.id);
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (data != null) {
      final formattedCreatedAt = DateFormat(
        'dd/MM/yyyy – HH:mm',
      ).format(data!.createdAt ?? DateTime.now());
      final formattedUpdatedAt = DateFormat(
        'dd/MM/yyyy – HH:mm',
      ).format(data!.updated ?? DateTime.now());
      return Container(
        decoration: BoxDecoration(
          color: colors.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            AppDimensions.kBorderRadius6,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kMargin20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kPadding30,
          vertical: AppDimensions.kPadding20,
        ),
        child: Column(
          spacing: AppDimensions.kSpacing10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AppDimensions.kSpacing30,
              children: [
                SvgPicture.asset(
                  AppAssets.qrScan,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppDimensions.kSpacing5,
                  children: [
                    Text('Date created: $formattedCreatedAt'),
                    Text('Last modification: $formattedUpdatedAt'),
                  ],
                ),
              ],
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data!.data,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data!.type,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.push('/show_qr', extra: data);
              },
              child: Text(
                'Show QR Code',
                style: TextStyle(
                  color: colors.primary,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
