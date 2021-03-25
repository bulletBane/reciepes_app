import 'dart:io';

import 'package:get/get.dart';
import 'package:recipes_app/services/pick_file_service.dart';

class GalleryWidgetController extends GetxController {
  RxList<File> _images = RxList<File>();

  PickFileService _fileService = PickFileService();

  get images => _images;

  void pickImage() async {
    File image = await _fileService.pickImage();
    if (image != null) _images.add(image);
  }
}
