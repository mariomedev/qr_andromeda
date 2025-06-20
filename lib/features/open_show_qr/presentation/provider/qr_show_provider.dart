import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/core.dart';
import '../../../history/presentation/providers/providers.dart';
import '../../domain/domain.dart';
import 'qr_repository.dart';

final qrShowProvider = StateNotifierProvider<QrShowNotifier, QrShowState>((
  ref,
) {
  final qrRepo = ref.watch(qrRepositoryProvider); // Tu repositorio QR
  final permission = PermissionHandler();
  final saveService = ImageGallerySaver();
  final shareService = SharePlusImpl();
  return QrShowNotifier(
    qrRepo: qrRepo,
    permissionHandler: permission,
    imageSaver: saveService,
    shareService: shareService,
    ref: ref,
  );
});

class QrShowNotifier extends StateNotifier<QrShowState> {
  final QRRepo qrRepo;
  final PermissionAdapter permissionHandler;
  final ImagesSaveAdapter imageSaver;
  final ShareAdapter shareService;
  final Ref ref;

  QrShowNotifier({
    required this.qrRepo,
    required this.permissionHandler,
    required this.imageSaver,
    required this.shareService,
    required this.ref,
  }) : super(
         QrShowState(
           decoration: const PrettyQrDecoration(
             shape: PrettyQrSmoothSymbol(color: Colors.black),
             background: Colors.transparent,
             image: null,
             quietZone: PrettyQrQuietZone.zero,
           ),
         ),
       );

  Future<void> showAlert(BuildContext context, QREntity qr) async {
    final isNew = qr.id <= 0;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isNew ? 'Save Data' : 'Update Data'),
        content: Text(
          isNew
              ? 'Do you want to save this Data?'
              : 'Do you want to update this Data?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    (isNew) ? saveQr(qr) : updateQr(qr);
  }

  void updateDecoration(PrettyQrDecoration decoration) {
    state = state.copyWith(decoration: decoration);
  }

  void setQrImage(QrImage qrImage) {
    state = state.copyWith(qrImage: qrImage);
  }

  Future<bool> saveQr(QREntity qr) async {
    qr.color = getCurrentColor();
    try {
      await qrRepo.saveQRData(data: qr);
      ref.read(historyProvider.notifier).addQr(qr);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateQr(QREntity qr) async {
    qr.color = getCurrentColor();
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
