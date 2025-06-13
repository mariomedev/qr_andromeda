import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../shared/shared.dart';
import 'widgets/widgets.dart';

class OpenFileQrScreen extends StatelessWidget {
  final int id;
  const OpenFileQrScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(title: 'Result'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppDimensions.kSpacing30,
        children: [
          CardCustomOpen(
            id: id, // Replace with the actual ID you want to use
          ),
          //ButtonBarOpen(),
        ],
      ),
    );
  }
}
