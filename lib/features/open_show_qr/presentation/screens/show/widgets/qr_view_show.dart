import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../provider/providers.dart';
import 'widgets.dart';

class QrViewShow extends ConsumerStatefulWidget {
  final QREntity qr;

  const QrViewShow({
    super.key,
    required this.qr,
  });

  @override
  ConsumerState<QrViewShow> createState() => _QrViewShowState();
}

class _QrViewShowState extends ConsumerState<QrViewShow> {
  @protected
  late QrCode qrCode;

  @protected
  late QrImage qrImage;

  @protected
  late PrettyQrDecoration decoration;

  _initialDecoration() {
    return PrettyQrDecoration(
      shape: PrettyQrSmoothSymbol(
        color: widget.qr.color,
      ),
      image: const PrettyQrDecorationImage(
        image: AssetImage('assets/img/icon.png'),
        position: PrettyQrDecorationImagePosition.embedded,
      ),
      background: Colors.transparent,
      quietZone: PrettyQrQuietZone.zero,
    );
  }

  final valueQuietZone = PrettyQrQuietZone.zero.value;
  final valueQuietZone2 = PrettyQrQuietZone.standart.value;

  _colorSubscription() {
    final isNew = widget.qr.id <= 0;
    if (isNew) {
      decoration = ref.read(settingsQrProvider);
    } else {
      decoration = _initialDecoration();
    }

    ref.listenManual<PrettyQrDecoration>(settingsQrProvider, (prev, next) {
      decoration = next;
      setState(() {});
    });
  }

  Future<void> _handleSaveOrUpdate(BuildContext context) async {
    final notifier = ref.read(qrProvider);
    final isNew = widget.qr.id <= 0;

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

    final newQr = QREntity(
      data: widget.qr.data,
      updateAt: DateTime.now(),
      createdAt: isNew ? DateTime.now() : widget.qr.createdAt,
    )..color = shapeColor;

    if (isNew) {
      final id = await notifier.saveQRData(data: newQr);
      widget.qr.createdAt = DateTime.now();
      widget.qr.id = id;
    } else {
      await notifier.updateQrData(id: widget.qr.id, data: newQr);
    }

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isNew ? 'QR saved!' : 'QR updated!'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Color get shapeColor {
    var shape = decoration.shape;
    if (shape is PrettyQrSmoothSymbol) return shape.color;
    if (shape is PrettyQrRoundedSymbol) return shape.color;
    return Colors.black;
  }

  QrImage _getQrImage() {
    qrCode = QrCode.fromData(
      data: widget.qr.data,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    return QrImage(qrCode);
  }

  Future<ByteData?> _imageToBytes(int size) async {
    try {
      final freshQrImage = _getQrImage();
      return await freshQrImage.toImageAsBytes(
        decoration: decoration,
        format: ui.ImageByteFormat.png,
        size: size,
      );
    } catch (e) {
      debugPrint('Error generating QR image: $e');
      return null;
    }
  }

  @override
  void initState() {
    _colorSubscription();
    qrImage = _getQrImage();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final PermissionAdapter permissionHandler = PermissionHandler();
    final ImagesSaveAdapter imageSaveAdapter = ImageGallerySaver();
    final ShareAdapter shareAdapter = SharePlusImpl();
    return Column(
      spacing: AppDimensions.kPadding10,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: BoxBorder.all(
              color: colors.primary,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.kBorderRadius6),
          ),
          height: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.all(AppDimensions.kPadding5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.kBorderRadius6),
            child: PrettyQrView(
              qrImage: qrImage,
              decoration: decoration,
            ),
          ),
        ),
        SettingsQrShow(
          decoration: decoration,
          onChanged: (value) {
            ref.read(settingsQrProvider.notifier).state = value;
          },
          onExportPressed: (size) async {
            await permissionHandler.requestPermissionStorage();
            final image = await _imageToBytes(size);
            if (image == null) return null;
            final result = await imageSaveAdapter.saveImageToGallery(
              image: image,
            );
            return result;
          },
        ),
        ButtonBarShow(
          onPressedSave: () {
            _handleSaveOrUpdate(context);
          },
          onPressedShare: () async {
            final image = await _imageToBytes(1024);
            shareAdapter.shareImageFromByteData(image);
          },
        ),
      ],
    );
  }
}
