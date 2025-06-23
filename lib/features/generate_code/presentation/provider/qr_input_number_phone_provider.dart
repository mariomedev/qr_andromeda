import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputNumberPhoneProvider =
    StateNotifierProvider<QrInputNumberPhoneNotifier, QrInputNumberPhoneState>((
      ref,
    ) {
      return QrInputNumberPhoneNotifier();
    });

class QrInputNumberPhoneNotifier
    extends StateNotifier<QrInputNumberPhoneState> {
  QrInputNumberPhoneNotifier() : super(QrInputNumberPhoneState());

  void onTextInputChanged({
    required String value,
  }) {
    final newphone = NumberInput.dirty(value: value);
    final isValid = newphone.isValid;

    state = state.copyWith(
      phone: newphone,
      isValid: isValid,
      errorMessage: newphone.errorMessage,
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
        data: 'https://wa.me/${state.phone.value.replaceFirst(r'+', '')}',
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

class QrInputNumberPhoneState {
  final NumberInput phone;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputNumberPhoneState({
    this.phone = const NumberInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputNumberPhoneState copyWith({
    NumberInput? phone,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputNumberPhoneState(
      phone: phone ?? this.phone,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $phone, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
