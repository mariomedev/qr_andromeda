import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

abstract class ShareAdapter {
  Future<String> shareText(String text);
  Future<String> shareImageFromByteData(ByteData? image);
  Future<String> shareFile(String filePath);
}

class SharePlusImpl implements ShareAdapter {
  @override
  Future<String> shareFile(String filePath) {
    throw UnimplementedError();
  }

  @override
  Future<String> shareImageFromByteData(ByteData? image) async {
    if (image == null) return 'No image to share.';

    final Uint8List bytes = image.buffer.asUint8List();

    try {
      final result = ShareParams(
        text: 'Check this QR code!',
        files: [
          XFile.fromData(
            bytes,
            mimeType: 'image/png',
            name: 'qr_code.png',
          ),
        ],
        fileNameOverrides: ['qr_code.png'],
      );

      final shareResult = await SharePlus.instance.share(result);

      switch (shareResult.status) {
        case ShareResultStatus.success:
          return 'Image shared successfully!';
        case ShareResultStatus.unavailable:
          return 'Sharing is unavailable on this platform.';
        case ShareResultStatus.dismissed:
          return 'Sharing was dismissed.';
      }
    } catch (e) {
      return 'Error sharing image: $e';
    }
  }

  @override
  Future<String> shareText(String text) {
    throw UnimplementedError();
  }
}
