import 'dart:io';
import 'package:get/get.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/gallery/controller/gallery_widget_controller.dart';
import 'package:recipes_app/presentation/shared/const.dart';
import 'package:recipes_app/services/storage_service.dart';

class CreateRecipeController extends GetxController {
  StorageService _storageService = StorageService();

  final galleryController = Get.find<GalleryWidgetController>();

  List<String> _galery = [];

  void uploadImage() async {
    for (File photo in galleryController.images) {
      String uri =
          await _storageService.uploadPhoto(photo, RECIPES_GALEY_PHOTO_PATH);
      _galery.add(uri);
      print(uri);
    }
  }
}
