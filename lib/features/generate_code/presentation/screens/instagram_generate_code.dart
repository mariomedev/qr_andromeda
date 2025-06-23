import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class InstagramGenerateCode extends ConsumerWidget {
  const InstagramGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputInstagramProvider);
    final controller = ref.read(qrInputInstagramProvider.notifier);
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textTitle,
      ),
      body: BoxCodeGenerate(
        title: AppText.textTitle,
        iconSvg: AppAssets.textIcon,
        children: [
          TextFieldCodeGenerate(
            title: AppText.textTitle,
            onChanged: (value) =>
                controller.onInstagramInputChanged(value: value),
            errorText: state.hasSubmitted ? state.errorMessage : null,
          ),
        ],
        onPressed: () => controller.submitQrForm(
          context: context,
          type: AppText.textType,
        ),
      ),
    );
  }
}
