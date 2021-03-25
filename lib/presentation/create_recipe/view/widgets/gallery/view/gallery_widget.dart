import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_app/presentation/create_recipe/controller/create_recipe_controller.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/gallery/controller/gallery_widget_controller.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class GalleryFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GalleryWidgetController());
    final controller = Get.find<GalleryWidgetController>();
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
                Txt.h3('Галерея'),
                Icon(CupertinoIcons.pencil),
              ],
            ),
            Obx(() => controller.images.isNotEmpty
                ? Column(
                    children: [
                      for (File file in controller.images)
                        Container(
                          width: 325.w,
                          margin: EdgeInsets.symmetric(vertical: 10.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.ssp),
                            child: Image.file(file),
                          ),
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
                  controller.pickImage();
                },
                child: Txt.h3(
                  "Нажмите что бы добавить фото",
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
