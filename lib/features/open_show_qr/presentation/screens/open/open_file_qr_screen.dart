import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import 'widgets/widgets.dart';

class OpenFileQrScreen extends StatelessWidget {
  const OpenFileQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCodeGenerate(title: 'Result'),
      body: Column(
        spacing: AppDimensions.kPadding30,
        children: [
          CardCustomOpen(),
          ButtonBarOpen(),
        ],
      ),
    );
  }
}
