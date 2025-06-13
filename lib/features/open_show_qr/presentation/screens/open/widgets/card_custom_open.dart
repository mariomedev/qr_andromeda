import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';
import 'package:qr_andromeda/features/open_show_qr/presentation/provider/qr_data/qr_provider.dart';

import '../../../../../../core/core.dart';

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
  QREntity qrData = QREntity(
    data: 'Loading...',
  );
  _getQrData() async {
    final data = await ref.read(qrProvider).getQrById(id: widget.id);

    if (data != null) {
      setState(() {
        qrData = data;
      });
    }
  }

  @override
  void initState() {
    _getQrData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final createdAtformatted = DateFormat(
      'dd/MM/yyyy – HH:mm',
    ).format(qrData.createdAt ?? DateTime.now());
    final updateAtformatted = DateFormat(
      'dd/MM/yyyy – HH:mm',
    ).format(qrData.updateAt ?? DateTime.now());
    return Container(
      decoration: BoxDecoration(
        color: colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
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
                  Text('createdAt: $createdAtformatted'),
                  Text('updateAt: $updateAtformatted'),
                ],
              ),
            ],
          ),
          const Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(qrData.data),
          ),
          TextButton(
            onPressed: () {
              context.push('/show_qr/${widget.id}');
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
}
