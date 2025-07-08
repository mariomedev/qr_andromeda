import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/core.dart';
import '../../../history/presentation/providers/providers.dart';
import '../../domain/domain.dart';
import 'qr_repository.dart';

final qrShowProvider =
    StateNotifierProvider.autoDispose<QrShowNotifier, QrShowState>((
      ref,
    ) {
      final qrRepo = ref.watch(qrRepositoryProvider);
      final historyQr = ref.watch(historyProvider.notifier);
      final permission = PermissionHandler();
      final saveService = ImageGallerySaver();
      final shareService = SharePlusImpl();
      return QrShowNotifier(
        qrRepo: qrRepo,
        permissionHandler: permission,
        imageSaver: saveService,
        shareService: shareService,
        historyQr: historyQr,
      );
    });

class QrShowNotifier extends StateNotifier<QrShowState> {
  final QRRepo qrRepo;
  final PermissionAdapter permissionHandler;
  final ImagesSaveAdapter imageSaver;
  final ShareAdapter shareService;
  final HistoryNotifier historyQr;

  QrShowNotifier({
    required this.qrRepo,
    required this.permissionHandler,
    required this.imageSaver,
    required this.shareService,
    required this.historyQr,
  }) : super(
         QrShowState(
           decoration: const PrettyQrDecoration(
             shape: PrettyQrSmoothSymbol(color: Colors.black),
             background: Colors.white,
             image: null,
             quietZone: PrettyQrQuietZone.zero,
           ),
         ),
       );

  Future<bool> saveOrUpdateQr(QREntity qr) async {
    qr.decoration = state.decoration;
    final isNew = qr.id <= 0;

    try {
      if (isNew) {
        await qrRepo.saveQRData(data: qr);
        historyQr.addQr(qr);
      } else {
        qr.updated = DateTime.now();
        await qrRepo.updateQrData(id: qr.id, data: qr);
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  void updateDecoration(PrettyQrDecoration decoration) {
    state = state.copyWith(decoration: decoration);
  }

  void setQrImage(QrImage qrImage) {
    state = state.copyWith(qrImage: qrImage);
  }

  Future<bool> saveQr(QREntity qr) async {
    try {
      await qrRepo.saveQRData(data: qr);
      historyQr.addQr(qr);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateQr(QREntity qr) async {
    qr.updated = DateTime.now();
    try {
      await qrRepo.updateQrData(id: qr.id, data: qr);
      return true;
    } catch (e) {
      return false;
    }
  }

  ui.Color getCurrentColor() {
    final shape = state.decoration.shape;
    if (shape is PrettyQrSmoothSymbol) return shape.color;
    if (shape is PrettyQrRoundedSymbol) return shape.color;
    return const ui.Color(0xFF000000);
  }

  Future<void> saveImage(QrImage qrImage, int size) async {
    await permissionHandler.requestPermissionStorage();
    final bytes = await qrImage.toImageAsBytes(
      decoration: state.decoration,
      format: ui.ImageByteFormat.png,
      size: size,
    );
    if (bytes != null) await imageSaver.saveImageToGallery(image: bytes);
  }

  Future<void> shareImage(QrImage qrImage) async {
    final bytes = await qrImage.toImageAsBytes(
      decoration: state.decoration,
      format: ui.ImageByteFormat.png,
      size: 1024,
    );
    if (bytes != null) await shareService.shareImageFromByteData(bytes);
  }
}

class QrShowState {
  final PrettyQrDecoration decoration;
  final QrImage? qrImage;

  QrShowState({
    required this.decoration,
    this.qrImage,
  });

  QrShowState copyWith({
    PrettyQrDecoration? decoration,
    QrImage? qrImage,
  }) => QrShowState(
    decoration: decoration ?? this.decoration,
    qrImage: qrImage ?? this.qrImage,
  );
}
