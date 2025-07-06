import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputWifiProvider =
    StateNotifierProvider.autoDispose<QrInputWifiNotifier, QrInputWifiState>((
      ref,
    ) {
      return QrInputWifiNotifier();
    });

class QrInputWifiNotifier extends StateNotifier<QrInputWifiState> {
  QrInputWifiNotifier() : super(QrInputWifiState());

  void onWifiInputChanged({
    required String value,
  }) {
    final newWifi = EmptyInput.dirty(value: value);

    state = state.copyWith(
      wifi: newWifi,
      isValid: Formz.validate([newWifi, state.password]),
      errorMessage: newWifi.errorMessage,
    );
  }

  void onPasswordInputChanged({
    required String value,
  }) {
    final newPassword = EmptyInput.dirty(value: value);

    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.wifi]),
      errorMessage: newPassword.errorMessage,
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
      final qr = QREntity.fromDecoration(
        data: '${state.wifi.value} ${state.password.value}',
        isFromScan: false,
        type: type,
        decoration: const PrettyQrDecoration(),
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

class QrInputWifiState {
  final EmptyInput wifi;
  final EmptyInput password;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputWifiState({
    this.wifi = const EmptyInput.pure(),
    this.password = const EmptyInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputWifiState copyWith({
    EmptyInput? wifi,
    EmptyInput? password,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputWifiState(
      wifi: wifi ?? this.wifi,
      password: password ?? this.password,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
