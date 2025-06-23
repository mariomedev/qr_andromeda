import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class XGenerateCode extends ConsumerWidget {
  const XGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputTwitterProvider);
    final controller = ref.read(qrInputTwitterProvider.notifier);
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textX,
      ),
      body: BoxCodeGenerate(
        title: AppText.textX,
        iconSvg: AppAssets.xIcon,
        children: [
          TextFieldCodeGenerate(
            title: 'X Username',
            onChanged: (value) => controller.onXInputChanged(value: value),
            errorText: state.hasSubmitted ? state.errorMessage : null,
          ),
        ],
        onPressed: () => controller.submitQrForm(
          context: context,
          type: AppText.xType,
        ),
      ),
    );
  }
}
