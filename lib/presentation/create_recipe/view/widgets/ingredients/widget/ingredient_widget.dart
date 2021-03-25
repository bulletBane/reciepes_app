import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/ingridient.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/create_ingredient_controller.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/ingredient_widget_controller.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/widget/create_ingredient_bottom_sheet.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/page_components/ingredient_button.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class IngredientWidget extends GetWidget<INgredientWidgetController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
            color: Get.theme.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 0),
                color: Colors.black.withOpacity(0.2),
              )
            ],
            borderRadius: BorderRadius.circular(10.ssp)),
        width: 325.w,
        padding: EdgeInsets.all(16.ssp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt.h3('Ингредиенты'),
                Icon(CupertinoIcons.pencil),
              ],
            ),
            Obx(() => controller.ingridients != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      for (int i = 0; i < controller.ingridients.length; i++)
                        IngredientButton(
                          ingridient: controller.ingridients[i],
                          onCloseTapped: () {
                            controller.deleteIngredient =
                                controller.ingridients[i];
                          },
                          onPressed: () {
                            controller.editIngredient(
                                controller.ingridients[i], i);
                            controller.openBottomSheet(
                              WillPopScope(
                                  onWillPop: () {
                                    return;
                                  },
                                  child: CreateIngredientBottomSheet()),
                            );
                          },
                        )
                    ],
                  )
                : Container()),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 295.w,
              height: 50.h,
              child: TextButton(
                onPressed: () {
                  Get.put(CreateIngredientController());
                  controller.openBottomSheet(
                    WillPopScope(
                        onWillPop: () {
                          return;
                        },
                        child: CreateIngredientBottomSheet()),
                  );
                },
                child: Txt.h3(
                  "Нажмите что бы добавить ингредиент",
                  color: Get.theme.hintColor,
                ),
                style: TextButton.styleFrom(
                    primary: Get.theme.hintColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.ssp),
                        side: BorderSide(
                            color: Get.theme.hintColor, width: 1.h))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
