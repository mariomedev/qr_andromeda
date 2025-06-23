import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputPhoneProvider =
    StateNotifierProvider.autoDispose<QrInputPhoneNotifier, QrInputPhoneState>((
      ref,
    ) {
      return QrInputPhoneNotifier();
    });

class QrInputPhoneNotifier extends StateNotifier<QrInputPhoneState> {
  QrInputPhoneNotifier() : super(QrInputPhoneState());

  void onPhoneInputChanged({
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
        data: state.phone.value,
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

class QrInputPhoneState {
  final NumberInput phone;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputPhoneState({
    this.phone = const NumberInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputPhoneState copyWith({
    NumberInput? phone,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputPhoneState(
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
