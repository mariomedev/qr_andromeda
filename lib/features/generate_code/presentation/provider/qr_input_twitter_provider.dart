import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputTwitterProvider =
    StateNotifierProvider.autoDispose<
      QrInputTwitterNotifier,
      QrInputTwitterState
    >((
      ref,
    ) {
      return QrInputTwitterNotifier();
    });

class QrInputTwitterNotifier extends StateNotifier<QrInputTwitterState> {
  QrInputTwitterNotifier() : super(QrInputTwitterState());

  void onXInputChanged({
    required String value,
  }) {
    final newUserName = EmptyInput.dirty(value: value);
    final isValid = newUserName.isValid;

    state = state.copyWith(
      userName: newUserName,
      isValid: isValid,
      errorMessage: newUserName.errorMessage,
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
        data: 'https://x.com/${state.userName.value}',
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

class QrInputTwitterState {
  final EmptyInput userName;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputTwitterState({
    this.userName = const EmptyInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputTwitterState copyWith({
    EmptyInput? userName,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputTwitterState(
      userName: userName ?? this.userName,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $userName, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
