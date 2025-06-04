import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class WifiGenerateCode extends StatelessWidget {
  const WifiGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textWifi,
      ),
      body: BoxCodeGenerate(
        title: AppText.textWifi,
        iconSvg: AppAssets.wifiIcon,
        children: [
          const TextFieldCodeGenerate(
            title: 'NetWork',
          ),
          const TextFieldCodeGenerate(
            title: 'Password',
          ),
        ],
      ),
    );
  }
}
