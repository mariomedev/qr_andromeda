import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class EventGenerateCode extends StatelessWidget {
  const EventGenerateCode({super.key});

  @override
  Widget build(BuildContext context) {
    final double subtraction =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: const AppBarCodeGenerate(
        title: AppText.textEvent,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - subtraction,
          ),
          child: Center(
            child: BoxCodeGenerate(
              title: AppText.textEvent,
              iconSvg: AppAssets.eventIcon,
              children: [
                const TextFieldCodeGenerate(
                  title: 'Event Name',
                ),
                const TextFieldCodeGenerate(
                  title: 'Start Date and Time',
                ),
                const TextFieldCodeGenerate(
                  title: 'End Date and Time',
                ),
                const TextFieldCodeGenerate(
                  title: 'Event Location',
                ),
                const TextFieldCodeGenerate(
                  title: 'Description',
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
