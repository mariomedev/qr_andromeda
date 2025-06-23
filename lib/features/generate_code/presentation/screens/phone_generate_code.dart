import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../provider/provider.dart';
import 'widgets/widgets.dart';

class PhoneGenerateCode extends ConsumerWidget {
  const PhoneGenerateCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(qrInputPhoneProvider);
    final controller = ref.read(qrInputPhoneProvider.notifier);
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
            onChanged: (value) => controller.onPhoneInputChanged(value: value),
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
