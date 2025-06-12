import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../../../core/core.dart';
import '../../../provider/providers.dart';
import 'widgets.dart';

class QrViewShow extends ConsumerStatefulWidget {
  final String data;

  const QrViewShow({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<QrViewShow> createState() => _QrViewShowState();
}

class _QrViewShowState extends ConsumerState<QrViewShow> {
  late final ProviderSubscription<Color> colorSubscription;

  @protected
  late QrCode qrCode;

  @protected
  late QrImage qrImage;

  @protected
  late PrettyQrDecoration decoration;

  _colorSubscription() {
    final currentColor = ref.read(pickerColorProvider);
    decoration = PrettyQrDecoration(
      shape: PrettyQrSmoothSymbol(
        color: currentColor,
      ),
      image: const PrettyQrDecorationImage(
        image: AssetImage('assets/img/icon.png'),
        position: PrettyQrDecorationImagePosition.embedded,
      ),
      background: Colors.transparent,
      quietZone: PrettyQrQuietZone.zero,
    );

    colorSubscription = ref.listenManual<Color>(
      pickerColorProvider,
      (prev, next) {
        setState(() {
          decoration = decoration.copyWith(
            shape: PrettyQrSmoothSymbol(color: next),
          );
        });
      },
    );
  }

  QrImage _getQrImage() {
    qrCode = QrCode.fromData(
      data: widget.data,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    return QrImage(qrCode);
  }

  Future<ByteData?> _imageToBytes(size) async {
    final freshQrImage = _getQrImage();

    return await freshQrImage.toImageAsBytes(
      decoration: decoration,
      format: ui.ImageByteFormat.png,
      size: size,
    );
  }

  @override
  void initState() {
    _colorSubscription();
    qrImage = _getQrImage();
    super.initState();
  }

  @override
  void dispose() {
    colorSubscription.close();
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
          onChanged: (value) => setState(() {
            decoration = value;
          }),
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
          onPressedSave: () {},
          onPressedShare: () async {
            final image = await _imageToBytes(1024);
            final result = shareAdapter.shareImageFromByteData(image);
            print('Share Image: ${result.toString()}');
          },
        ),
      ],
    );
  }
}
