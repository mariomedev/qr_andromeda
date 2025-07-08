import 'package:image_picker/image_picker.dart';

abstract class SelectImageAdapter {
  Future<XFile?> selectImagefromGallery();
}

class ImagePickerPackage implements SelectImageAdapter {
  @override
  Future<XFile?> selectImagefromGallery() async {
    final ImagePicker picker = ImagePicker();

    Future<XFile?> pickImageFromGallery() async {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      return image;
    }

    try {
      return await pickImageFromGallery();
    } catch (e) {
      throw Exception('Error selecting image: $e');
    }
  }
}
