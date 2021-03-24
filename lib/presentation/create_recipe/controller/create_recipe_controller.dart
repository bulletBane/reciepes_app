import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/services/storage_service.dart';

class CreateRecipeController extends GetxController {
  StorageService _storageService = StorageService();
  ImagePicker _picker = ImagePicker();

  RxList<File> images = RxList<File>();

  List<String> _galery = [];

  void pickImage() async {
    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      File image = File(pickedFile.path);

      images.add(image);
    } catch (e) {
      print(e);
    }
  }

  void uploadImage() async {
    for (File photo in images) {
      String uri = await _storageService.uploadPhoto(photo);
      _galery.add(uri);
      print(uri);
    }
  }
}
