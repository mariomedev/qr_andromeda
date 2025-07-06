import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../../provider/providers.dart' show qrShowProvider;

Future<void> showSaveOrUpdateDialog({
  required BuildContext context,
  required WidgetRef ref,
  required QREntity qr,
}) async {
  final isNew = qr.id <= 0;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(isNew ? 'Save Data' : 'Update Data'),
      content: Text(
        isNew
            ? 'Do you want to save this Data?'
            : 'Do you want to update this Data?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Confirm'),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    final controller = ref.read(qrShowProvider.notifier);
    final success = await controller.saveOrUpdateQr(qr);

    if (context.mounted) {
      final msg = success
          ? (isNew ? 'QR saved successfully' : 'QR updated')
          : 'An error occurred';
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(msg)));
    }
  }
}
