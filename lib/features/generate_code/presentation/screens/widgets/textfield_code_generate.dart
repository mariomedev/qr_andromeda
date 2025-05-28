import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class TextFieldCodeGenerate extends StatelessWidget {
  final void Function(String)? onChanged;

  const TextFieldCodeGenerate({
    super.key,
    this.onChanged,
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
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.all(
          AppDimensions.kPadding5,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
