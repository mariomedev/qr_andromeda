import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class EmailGenerateCode extends ConsumerWidget {
  const EmailGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputEmailProvider);
    final controller = ref.read(qrInputEmailProvider.notifier);
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textTitle,
      ),
      body: BoxCodeGenerate(
        title: AppText.textWhatsapp,
        iconSvg: AppAssets.whatsAppIcon,
        children: [
          TextFieldCodeGenerate(
            title: AppText.textWhatsapp,
            onChanged: (value) => controller.onEmailInputChanged(value: value),
            errorText: state.hasSubmitted ? state.errorMessage : null,
          ),
        ],
        onPressed: () => controller.submitQrForm(
          context: context,
          type: AppText.emailType,
        ),
      ),
    );
  }
}
