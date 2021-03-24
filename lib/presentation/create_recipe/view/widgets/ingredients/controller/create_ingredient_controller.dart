import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/data/models/ingridient.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/ingredient_widget_controller.dart';

class CreateIngredientController extends GetxController {
  Ingridient _ingredient = Ingridient();

  Rx<File> _image = Rx<File>();

  ImagePicker _picker = ImagePicker();

  TextEditingController textEditingController = TextEditingController();

  final parentController = Get.find<INgredientWidgetController>();

  void pickImage() async {
    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 100,
      );
      _image.value = File(pickedFile.path);
    } catch (e) {
      print(e);
    }
  }

  void saveIngredient() {
    _ingredient =
        Ingridient(photo: _image.value, title: textEditingController.text);

    parentController.ingridients = _ingredient;
    Get.back();
  }

  get image => _image.value;

  get ingredient => _ingredient;
}
