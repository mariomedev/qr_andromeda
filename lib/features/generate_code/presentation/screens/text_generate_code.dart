import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_andromeda/features/generate_code/presentation/provider/qr_input_provider.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class TextGenerateCode extends ConsumerWidget {
  const TextGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputProvider);
    final controller = ref.read(qrInputProvider.notifier);
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
            onChanged: (value) => controller.onTextInputChanged(value: value),
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
