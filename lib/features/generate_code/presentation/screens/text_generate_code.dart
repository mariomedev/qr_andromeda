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
            onChanged: (value) {
              ref
                  .watch(qrInputProvider.notifier)
                  .textQrInputChanged(value: value);
            },
            errorText: state.hasSubmitted ? null : state.errorMessage,
          ),
        ],
        onPressed: () {
          ref.read(qrInputProvider.notifier).sendData(context: context);
        },
      ),
    );
  }
}
