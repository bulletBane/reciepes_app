import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/presentation/create_recipe/controller/create_recipe_controller.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/recipe_field.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CreateRecipeController());
    final controller = Get.find<CreateRecipeController>();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            splashRadius: 20.w,
            color: Get.theme.hintColor,
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Создать рецепт',
            style: GoogleFonts.nunito(
              color: Get.theme.primaryColorDark,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        children: [
          RecipeFieldWidget(
            title: 'Gallery',
            onPressed: () {
              controller.pickImage();
            },
            buttonTitle: 'Upload Image Or Open Camera',
          ),
          RecipeFieldWidget(
            title: 'Gallery',
            onPressed: () {},
            buttonTitle: 'Upload Image Or Open Camera',
          ),
          RecipeFieldWidget(
            title: 'Gallery',
            onPressed: () {},
            buttonTitle: 'Upload Image Or Open Camera',
          ),
          TextButton(onPressed: () {}, child: Text('create task'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_file),
        onPressed: () {
          controller.uploadImage();
        },
      ),
    );
  }
}
