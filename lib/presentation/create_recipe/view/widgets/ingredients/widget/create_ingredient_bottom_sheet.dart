import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/controller/create_ingredient_controller.dart';
import 'package:recipes_app/presentation/shared/components/buttons/green_flat_button.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class CreateIngredientBottomSheet
    extends GetWidget<CreateIngredientController> {
  CreateIngredientBottomSheet();
  @override
  Widget build(BuildContext context) {
    String sheetTitle = controller.indexOfIngredient != null
        ? 'Редактирование инегрдиента'
        : 'Добавьте ингридиент';

    return ColorfulSafeArea(
      color: Get.theme.backgroundColor,
      child: BottomSheet(
          backgroundColor: Get.theme.backgroundColor,
          enableDrag: true,
          onClosing: () {
            controller.clear();
          },
          builder: (context) {
            return Container(
              height: 1.sh,
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Txt.h3(sheetTitle),
                            GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  Get.back();
                                },
                                child: Icon(Icons.close_rounded))
                          ],
                        ),
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
                              child: Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  validator: (value) {
                                    return value.isNotEmpty
                                        ? null
                                        : 'Вы должны дать название ингредиенту';
                                  },
                                  controller: controller.textController,
                                  decoration:
                                      InputDecoration(labelText: 'Ингридиент'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  GreenButton(
                    data: 'Сохранить',
                    onPressed: () {
                      controller.saveIngredient();
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
