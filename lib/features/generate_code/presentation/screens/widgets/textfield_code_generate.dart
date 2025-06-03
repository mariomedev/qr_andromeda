import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class TextFieldCodeGenerate extends StatelessWidget {
  final int? maxLines;
  final String title;
  final void Function(String)? onChanged;

  const TextFieldCodeGenerate({
    super.key,
    this.onChanged,
    required this.title,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: colors.primary,
        width: 1,
        strokeAlign: 2,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.kBorderRadius6),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              border: border,
              enabledBorder: border,
              contentPadding: const EdgeInsets.all(
                AppDimensions.kPadding5,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
