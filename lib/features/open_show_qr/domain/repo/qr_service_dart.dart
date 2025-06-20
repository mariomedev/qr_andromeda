import 'dart:typed_data';

import '../../../../core/core.dart';

class QrService {
  final PermissionAdapter permissionHandler;
  final ImagesSaveAdapter imageSaveAdapter;
  final ShareAdapter shareAdapter;

  QrService({
    required this.permissionHandler,
    required this.imageSaveAdapter,
    required this.shareAdapter,
  });

  Future<void> saveImage(ByteData image) async {
    await permissionHandler.requestPermissionStorage();
    await imageSaveAdapter.saveImageToGallery(image: image);
  }

  Future<void> shareImage(ByteData image) async {
    await shareAdapter.shareImageFromByteData(image);
  }
}
