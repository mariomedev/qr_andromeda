import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets/widgets.dart';

class BusinessGenerateCode extends StatelessWidget {
  const BusinessGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    final double subtraction =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textBusiness,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - subtraction,
          ),
          child: BoxCodeGenerate(
            title: AppText.textBusiness,
            iconSvg: AppAssets.businessIcon,
            children: [
              const TextFieldCodeGenerate(
                title: 'Company Name',
              ),
              const TextFieldCodeGenerate(
                title: 'Industry',
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
