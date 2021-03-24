import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/recipe_model.dart';
import 'package:recipes_app/data/repo/recipes_repo.dart';
import 'package:recipes_app/data/repo/user_db.dart';
import 'package:recipes_app/presentation/auth/controller/auth_controller.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  final RecipesRepo db = RecipesRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Get.find<AuthController>().signOut();
                },
                child: Container(
                  child: Text('HOME'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/createRecipe');
                },
                child: Container(
                  child: Text('CREATE RECIPE'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  List<Recipe> recipes = await db.getRecipesList();
                  print(recipes);
                },
                child: Container(
                  child: Text('GET RECIPES'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
