import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/entities/qr_entity.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class TextGenerateCode extends StatefulWidget {
  const TextGenerateCode({super.key});

  @override
  State<TextGenerateCode> createState() => _TextGenerateCodeState();
}

class _TextGenerateCodeState extends State<TextGenerateCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textTitle,
      ),
      body: BoxCodeGenerate(
        title: AppText.textTitle,
        iconSvg: AppAssets.textIcon,
        children: [
          TextFieldCodeGenerate(
            onChanged: (value) {
              controller = TextEditingController(text: value);
            },
            title: AppText.textTitle,
          ),
        ],
        onPressed: () {
          final qr = QREntity(
            data: controller.value.text,
            isFromScan: false,
            type: 'TEXT',
          );
          context.push(
            '/show_qr',
            extra: qr,
          );
        },
      ),
    );
  }
}
