import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class ContactGenerateCode extends StatelessWidget {
  const ContactGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    final double subtraction =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textContact,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - subtraction,
          ),
          child: BoxCodeGenerate(
            title: AppText.textContact,
            iconSvg: AppAssets.contactIcon,
            children: [
              const Row(
                children: [
                  Expanded(child: TextFieldCodeGenerate(title: 'Name')),
                  Expanded(child: TextFieldCodeGenerate(title: 'Email')),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: TextFieldCodeGenerate(title: 'Company')),
                  Expanded(child: TextFieldCodeGenerate(title: 'Job')),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: TextFieldCodeGenerate(title: 'Phone')),
                  Expanded(child: TextFieldCodeGenerate(title: 'Email')),
                ],
              ),
              const TextFieldCodeGenerate(
                title: 'WebSide',
              ),
              const TextFieldCodeGenerate(
                title: 'Address',
              ),
              const Row(
                children: [
                  Expanded(child: TextFieldCodeGenerate(title: 'City')),
                  Expanded(child: TextFieldCodeGenerate(title: 'Country')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
