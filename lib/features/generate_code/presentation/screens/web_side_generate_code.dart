import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets/widgets.dart';

class WebSideGenerateCode extends StatelessWidget {
  const WebSideGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textWebSide,
      ),
      body: BoxCodeGenerate(
        title: AppText.textWebSide,
        iconSvg: AppAssets.webSiteIcon,
        children: [
          const TextFieldCodeGenerate(
            title: AppText.textWebSide,
          ),
          const TextFieldCodeGenerate(
            title: AppText.textWebSide,
          ),
        ],
      ),
    );
  }
}
