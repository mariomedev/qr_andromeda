import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class WifiGenerateCode extends ConsumerWidget {
  const WifiGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputWifiProvider);
    final controller = ref.read(qrInputWifiProvider.notifier);
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textWifi,
      ),
      body: BoxCodeGenerate(
        title: AppText.textWifi,
        iconSvg: AppAssets.wifiIcon,
        children: [
          TextFieldCodeGenerate(
            title: 'NetWork',
            errorText: state.hasSubmitted ? state.errorMessage : null,
            onChanged: (value) => controller.onWifiInputChanged(value: value),
          ),
          TextFieldCodeGenerate(
            title: 'Password',
            errorText: state.hasSubmitted ? state.errorMessage : null,
            onChanged: (value) =>
                controller.onPasswordInputChanged(value: value),
          ),
        ],
        onPressed: () =>
            controller.submitQrForm(context: context, type: AppText.wifiType),
      ),
    );
  }
}
