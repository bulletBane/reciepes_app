import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/create_ingredient_controller.dart';
import 'package:recipes_app/presentation/shared/components/buttons/green_flat_button.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class CreateIngredientBottomSheet
    extends GetWidget<CreateIngredientController> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        enableDrag: true,
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 250.h,
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt.h1('Добавьте ингридиент'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: Obx(() {
                          return controller.image != null
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3000)),
                                  child: Image.file(
                                    controller.image,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Icon(CupertinoIcons.camera);
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Ингридиент'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                GreenButton(
                  data: 'Сохранить',
                  onPressed: () {
                    controller.saveIngredient();
                  },
                )
              ],
            ),
          );
        });
  }
}
