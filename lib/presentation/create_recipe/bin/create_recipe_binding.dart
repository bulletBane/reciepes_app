import 'package:get/get.dart';
import 'package:recipes_app/presentation/create_recipe/controller/create_recipe_controller.dart';

class CreateRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => CreateRecipeController());
  }
}
