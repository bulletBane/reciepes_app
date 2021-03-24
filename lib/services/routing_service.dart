import 'package:get/get.dart';
import 'package:recipes_app/presentation/create_recipe/bin/create_recipe_binding.dart';
import 'package:recipes_app/presentation/create_recipe/view/create_recipe_view.dart';

class RoutingService {
  static List<GetPage> routes = [
    GetPage(
        name: '/createRecipe',
        page: () => CreateRecipeView(),
        binding: CreateRecipeBinding())
  ];
}
