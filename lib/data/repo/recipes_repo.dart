import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_app/data/models/recipe_model.dart';

class RecipesRepo {
  FirebaseFirestore _storage = FirebaseFirestore.instance;
  CollectionReference _recipes =
      FirebaseFirestore.instance.collection('recipes');

  Future<List<Recipe>> getRecipesList() async {
    try {
      QuerySnapshot snapshot = await _storage.collection('recipes').get();
      List<Recipe> recipes = [];
      for (DocumentSnapshot doc in snapshot.docs) {
        recipes.add(Recipe.fromDoc(
          doc,
        ));
      }
      return recipes;
    } catch (e) {
      rethrow;
    }
  }

  void createReciepe(Recipe recipe) async {
    try {
      String docUID =
          await _recipes.add(recipe.toJson()).then((value) => value.id);
      _recipes.doc(docUID).update({'uid': docUID});
    } catch (e) {
      print(e);
    }
  }
}
