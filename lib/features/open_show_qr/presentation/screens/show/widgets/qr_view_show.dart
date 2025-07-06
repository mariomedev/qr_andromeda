import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../domain/domain.dart';
import '../../../provider/providers.dart';
import 'widgets.dart';

class QrViewShow extends ConsumerWidget {
  final QREntity qr;

  const QrViewShow({super.key, required this.qr});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrShowProvider);
    final controller = ref.read(qrShowProvider.notifier);

    final qrImage = QrImage(
      QrCode.fromData(
        data: qr.data,
        errorCorrectLevel: QrErrorCorrectLevel.H,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(qrShowProvider.notifier);
      final qrImage = QrImage(
        QrCode.fromData(
          data: qr.data,
          errorCorrectLevel: QrErrorCorrectLevel.H,
        ),
      );

      // Solo si no se ha inicializado aún
      if (ref.read(qrShowProvider).qrImage == null) {
        controller.setQrImage(qrImage);
        controller.updateDecoration(qr.decoration); // ← Aquí lo asignas
      }
    });

    return Column(
      children: [
        QrImageBox(
          image: state.qrImage ?? qrImage,
          decoration: state.decoration,
        ),
        SettingsQrShow(
          decoration: state.decoration,
          onChanged: (newDecoration) {
            controller.updateDecoration(newDecoration);
          },
          onExportPressed: (size) async {
            await controller.saveImage(state.qrImage ?? qrImage, size);
            return 'QR successfully saved';
          },
        ),
        ButtonBarShow(
          qr: qr,
          onPressedSave: () => showSaveOrUpdateDialog(
            context: context,
            ref: ref,
            qr: qr,
          ),
          onPressedShare: () => controller.shareImage(state.qrImage!),
        ),
      ],
    );
  }
}
