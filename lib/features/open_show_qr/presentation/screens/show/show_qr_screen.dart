import 'package:flutter/material.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import 'widgets/widgets.dart';

class ShowQrScreen extends StatelessWidget {
  final String data;
  const ShowQrScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(title: 'Qr Code'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardCustomShow(
              data: data,
            ),
            QrViewShow(
              qr: QREntity(data: data),
            ),
            const SizedBox(height: AppDimensions.kMargin30),
          ],
        ),
      ),
    );
  }
}
