import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class TextGenerateCode extends StatelessWidget {
  const TextGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textTitle,
      ),
      body: BoxCodeGenerate(
        title: AppText.textTitle,
        iconSvg: AppAssets.textIcon,
        children: [
          const TextFieldCodeGenerate(
            title: AppText.textTitle,
          ),
        ],
      ),
    );
  }
}
