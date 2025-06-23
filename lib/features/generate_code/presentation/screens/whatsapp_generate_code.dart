import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class WhatsappGenerateCode extends ConsumerWidget {
  const WhatsappGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputNumberPhoneProvider);
    final controller = ref.read(qrInputNumberPhoneProvider.notifier);
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
            onChanged: (value) => controller.onTextInputChanged(value: value),
            errorText: state.hasSubmitted ? state.errorMessage : null,
          ),
        ],
        onPressed: () => controller.submitQrForm(
          context: context,
          type: AppText.whatsappType,
        ),
      ),
    );
  }
}
