import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../core.dart';

final selectImageProvider = StateNotifierProvider<SelectImageNotifier, XFile?>(
  (ref) {
    final selectImage = ImagePickerPackage();
    return SelectImageNotifier(selectImage: selectImage);
  },
);

class SelectImageNotifier extends StateNotifier<XFile?> {
  final SelectImageAdapter selectImage;

  SelectImageNotifier({required this.selectImage}) : super(null);

  Future<XFile?> selectImageFromGallery() async {
    try {
      final image = await selectImage.selectImagefromGallery();
      state = image;
      return image;
    } catch (e) {
      throw Exception('Error selecting image: $e');
    }
  }
}
