import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class TwitterGenerateCode extends ConsumerWidget {
  const TwitterGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputTwitterProvider);
    final controller = ref.read(qrInputTwitterProvider.notifier);
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
                controller.onTwitterInputChanged(value: value),
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
