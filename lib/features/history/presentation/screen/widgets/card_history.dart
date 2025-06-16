import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:qr_andromeda/features/history/presentation/providers/providers.dart';

import '../../../../../core/core.dart';
import '../../../../open_show_qr/domain/domain.dart';

class CardHistory extends ConsumerWidget {
  final QREntity qrEntity;
  const CardHistory({
    super.key,
    required this.qrEntity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final createdAtformatted = DateFormat(
      'dd/MM/yyyy – HH:mm',
    ).format(qrEntity.createdAt ?? DateTime.now());
    return Card(
      color: colors.onPrimaryContainer,
      child: ListTile(
        leading: Icon(
          Icons.arrow_forward_ios_rounded,
          color: colors.primary,
        ),
        title: Text(qrEntity.data),
        subtitle: const Text('Tipo: Text'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                ref.read(historyProvider.notifier).delete(id: qrEntity.id);
              },
              child: SvgPicture.asset(
                AppAssets.deleteIcon,
                colorFilter: ColorFilter.mode(
                  colors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(createdAtformatted),
          ],
        ),
      ),
    );
  }
}
