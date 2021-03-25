import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/ingridient.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/create_ingredient_controller.dart';

class INgredientWidgetController extends GetxController {
  RxList<Ingridient> _ingredients = RxList<Ingridient>();
  set addIngredient(Ingridient ingridient) => _ingredients.add(ingridient);

  List<Ingridient> get ingridients => _ingredients;

  void insertIngredient({int index, Ingridient ingridient}) {
    _ingredients.removeAt(index);
    _ingredients.insert(index, ingridient);
  }

  void editIngredient(Ingridient ingridient, int i) {
    final _bottomSheetController = Get.find<CreateIngredientController>();
    _bottomSheetController.image = ingridient.photo;
    _bottomSheetController.title = ingridient.title;
    _bottomSheetController.index = i;
  }

  void openBottomSheet(Widget bottomSheet) {
    Get.bottomSheet(bottomSheet,
        isDismissible: false,
        persistent: false,
        ignoreSafeArea: false,
        enableDrag: false,
        isScrollControlled: true);
  }
}
