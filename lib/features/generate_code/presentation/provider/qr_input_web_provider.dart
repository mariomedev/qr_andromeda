import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../open_show_qr/domain/domain.dart';

final qrInputWebProvider =
    StateNotifierProvider<QrInputWebNotifier, QrInputWebState>((
      ref,
    ) {
      return QrInputWebNotifier();
    });

class QrInputWebNotifier extends StateNotifier<QrInputWebState> {
  QrInputWebNotifier() : super(QrInputWebState());

  void onWebInputChanged({
    required String value,
  }) {
    final newWeb = WebInput.dirty(value: value);
    final isValid = newWeb.isValid;

    state = state.copyWith(
      web: newWeb,
      isValid: isValid,
      errorMessage: newWeb.errorMessage,
    );
  }

  void submitQrForm({
    required BuildContext context,
    required String type,
  }) {
    state = state.copyWith(hasSubmitted: true);
    final colors = Theme.of(context).colorScheme;
    if (state.isValid) {
      final qr = QREntity(
        data: state.web.value,
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

class QrInputWebState {
  final WebInput web;
  final String? errorMessage;
  final bool isValid;
  final bool hasSubmitted;

  QrInputWebState({
    this.web = const WebInput.pure(),
    this.errorMessage,
    this.isValid = false,
    this.hasSubmitted = false,
  });

  QrInputWebState copyWith({
    WebInput? web,
    String? errorMessage,
    bool? isValid,
    bool? hasSubmitted,
  }) {
    return QrInputWebState(
      web: web ?? this.web,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }

  @override
  String toString() =>
      '''
      QrInputState(
      input: $web, 
      errorMessage: $errorMessage, 
      isValid: $isValid, 
      hasSubmitted: $hasSubmitted
      )
      ''';
}
