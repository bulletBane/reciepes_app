import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickFileService {
  Future<File> pickImage() async {
    ImagePicker _picker = ImagePicker();
    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 100,
      );
      return File(pickedFile.path);
    } catch (e) {
      return null;
    }
  }
}
