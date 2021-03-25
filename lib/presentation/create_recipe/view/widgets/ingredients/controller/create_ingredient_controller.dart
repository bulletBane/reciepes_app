import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/ingridient.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/ingredient_widget_controller.dart';
import 'package:recipes_app/services/pick_file_service.dart';

class CreateIngredientController extends GetxController {
  get image => _image.value;

  get indexOfIngredient => _indexOfIngredient;

  set image(File file) => _image.value = file;

  set title(String text) => textController.text = text;

  set index(int index) => _indexOfIngredient = index;

  int _indexOfIngredient;

  Rx<File> _image = Rx<File>();

  PickFileService _fileService = PickFileService();

  TextEditingController textController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final parentController = Get.find<INgredientWidgetController>();

  void pickImage() async {
    File image = await _fileService.pickImage();
    if (image != null) _image.value = image;
  }

  void clear() {
    textController.text = '';
    _image = Rx<File>();
    _indexOfIngredient = null;
  }

  void saveIngredient() {
    if (formKey.currentState.validate()) {
      Ingridient ingridient =
          Ingridient(photo: _image.value, title: textController.text);
      if (_indexOfIngredient == null)
        parentController.addIngredient = ingridient;
      else
        parentController.insertIngredient(
            index: _indexOfIngredient, ingridient: ingridient);
      clear();
      Get.back();
    }
  }
}
