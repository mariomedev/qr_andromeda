import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class WebSideGenerateCode extends ConsumerWidget {
  const WebSideGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputWebProvider);
    final controller = ref.read(qrInputWebProvider.notifier);
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textWebSide,
      ),
      body: BoxCodeGenerate(
        title: AppText.textWebSide,
        iconSvg: AppAssets.webSiteIcon,
        children: [
          TextFieldCodeGenerate(
            title: AppText.textWebSide,
            errorText: state.hasSubmitted ? state.errorMessage : null,
            onChanged: (value) => controller.onWebInputChanged(value: value),
          ),
        ],
        onPressed: () => controller.submitQrForm(
          context: context,
          type: AppText.urlType,
        ),
      ),
    );
  }
}
