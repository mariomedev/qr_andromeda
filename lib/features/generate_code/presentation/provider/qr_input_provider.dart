import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputProvider =
    StateNotifierProvider.autoDispose<QrInputNotifier, QrInputState>((
      ref,
    ) {
      return QrInputNotifier();
    });

class QrInputNotifier extends StateNotifier<QrInputState> {
  QrInputNotifier() : super(QrInputState());

  void textQrInputChanged({
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

  void sendData({
    required BuildContext context,
  }) {
    final colors = Theme.of(context).colorScheme;
    state.copyWith(hasSubmitted: true);
    if (state.isValid) {
      final qr = QREntity(
        data: state.input.value,
        isFromScan: false,
        type: 'TEXT',
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
  final EmailInput emailInput;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputState({
    this.input = const EmptyInput.pure(),
    this.emailInput = const EmailInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputState copyWith({
    EmptyInput? input,
    EmailInput? emailInput,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputState(
      input: input ?? this.input,
      emailInput: emailInput ?? this.emailInput,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $input, 
      emailInput: $emailInput, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
