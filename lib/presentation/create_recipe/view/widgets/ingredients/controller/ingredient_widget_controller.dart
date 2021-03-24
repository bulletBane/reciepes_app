import 'package:get/get.dart';
import 'package:recipes_app/data/models/ingridient.dart';

class INgredientWidgetController extends GetxController {
  RxList<Ingridient> _ingredients = RxList<Ingridient>();
  set ingridients(Ingridient ingridient) => _ingredients.add(ingridient);
  get ingridients => _ingredients;
}
