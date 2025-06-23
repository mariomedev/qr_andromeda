import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputProvider = StateNotifierProvider<QrInputNotifier, QrInputState>((
  ref,
) {
  return QrInputNotifier();
});

class QrInputNotifier extends StateNotifier<QrInputState> {
  QrInputNotifier() : super(QrInputState());

  void onTextInputChanged({
    required String value,
  }) {
    final input = EmptyInput.dirty(value: value);
    final isValid = input.isValid;

    state = state.copyWith(
      input: input,
      isValid: isValid,
      errorMessage: input.errorMessage,
    );
  }

  void submitQrForm({
    required BuildContext context,
    required String type,
  }) {
    state = state.copyWith(
      hasSubmitted: true,
      errorMessage: state.errorMessage,
    );
    final colors = Theme.of(context).colorScheme;
    if (state.isValid) {
      final qr = QREntity(
        data: state.input.value,
        isFromScan: false,
        type: type,
      );
      context.push(
        '/show_qr',
        extra: qr,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage ?? 'Invalid input'),
          backgroundColor: colors.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

class QrInputState {
  final EmptyInput input;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputState({
    this.input = const EmptyInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputState copyWith({
    EmptyInput? input,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputState(
      input: input ?? this.input,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $input, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
