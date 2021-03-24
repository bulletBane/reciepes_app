import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalleryWidgetController extends GetxController {
  ImagePicker _picker = ImagePicker();

  RxList<File> _images = RxList<File>();

  get images => _images;

  void pickImage() async {
    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      File image = File(pickedFile.path);
      _images.add(image);
    } catch (e) {
      print(e);
    }
  }
}
