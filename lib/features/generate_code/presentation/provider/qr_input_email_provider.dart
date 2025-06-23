import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputEmailProvider =
    StateNotifierProvider.autoDispose<QrInputEmailNotifier, QrInputEmailState>((
      ref,
    ) {
      return QrInputEmailNotifier();
    });

class QrInputEmailNotifier extends StateNotifier<QrInputEmailState> {
  QrInputEmailNotifier() : super(QrInputEmailState());

  void onEmailInputChanged({
    required String value,
  }) {
    final newEmail = EmailInput.dirty(value: value);
    final isValid = newEmail.isValid;

    state = state.copyWith(
      email: newEmail,
      isValid: isValid,
      errorMessage: newEmail.errorMessage,
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
        data: state.email.value,
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

class QrInputEmailState {
  final EmailInput email;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputEmailState({
    this.email = const EmailInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputEmailState copyWith({
    EmailInput? email,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputEmailState(
      email: email ?? this.email,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $email, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
