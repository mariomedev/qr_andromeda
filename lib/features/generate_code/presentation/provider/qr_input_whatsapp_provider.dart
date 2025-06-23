import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputWhatsappProvider =
    StateNotifierProvider.autoDispose<
      QrInputWhatsappNotifier,
      QrInputWhatsappState
    >((
      ref,
    ) {
      return QrInputWhatsappNotifier();
    });

class QrInputWhatsappNotifier extends StateNotifier<QrInputWhatsappState> {
  QrInputWhatsappNotifier() : super(QrInputWhatsappState());

  void onWhatsappInputChanged({
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

class QrInputWhatsappState {
  final NumberInput phone;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputWhatsappState({
    this.phone = const NumberInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputWhatsappState copyWith({
    NumberInput? phone,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputWhatsappState(
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
