import 'dart:typed_data';

import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

abstract class ImagesSaveAdapter {
  Future<String> saveImageToGallery({ByteData? image});
}

class ImageGallerySaver implements ImagesSaveAdapter {
  @override
  Future<String> saveImageToGallery({ByteData? image}) async {
    try {
      if (image == null) {
        throw Exception('No image provided to save.');
      }
      final result = await ImageGallerySaverPlus.saveImage(
        image.buffer.asUint8List(),
        quality: 100,
      );

      return result['isSuccess'] == true
          ? 'Image saved successfully!'
          : 'Failed to save image.';
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }
}
