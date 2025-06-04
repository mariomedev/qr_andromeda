import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import 'widgets/widgets.dart';

class ShowQrScreen extends StatelessWidget {
  const ShowQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCodeGenerate(title: 'Qr Code'),
      body: Column(
        spacing: AppDimensions.kSpacing30,
        children: [
          CardCustomShow(),
          QrViewShow(),
          ButtonBarShow(),
        ],
      ),
    );
  }
}
