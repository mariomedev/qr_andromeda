import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets/widgets.dart';

class TextGenerateCode extends StatelessWidget {
  const TextGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: 'Text',
      ),
      body: BoxCodeGenerate(
        title: 'Text',
        iconSvg: AppAssets.textIcon,
        children: [
          const Text('Text'),
          const TextFieldCodeGenerate(),
        ],
      ),
    );
  }
}
