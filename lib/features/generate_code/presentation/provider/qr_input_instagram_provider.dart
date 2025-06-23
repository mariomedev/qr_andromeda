import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputInstagramProvider =
    StateNotifierProvider<QrInputInstagramNotifier, QrInputInstagramState>((
      ref,
    ) {
      return QrInputInstagramNotifier();
    });

class QrInputInstagramNotifier extends StateNotifier<QrInputInstagramState> {
  QrInputInstagramNotifier() : super(QrInputInstagramState());

  void onInstagramInputChanged({
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
      final qr = QREntity(
        data: 'https://www.instagram.com/${state.userName.value}',
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

class QrInputInstagramState {
  final EmptyInput userName;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputInstagramState({
    this.userName = const EmptyInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputInstagramState copyWith({
    EmptyInput? userName,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputInstagramState(
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
