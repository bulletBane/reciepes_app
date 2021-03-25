import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/ingridient.dart';
import 'package:recipes_app/presentation/create_recipe/view/widgets/ingredients/widget/create_ingredient_bottom_sheet.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Ingridient ingridient;
  final VoidCallback onCloseTapped;

  const IngredientButton(
      {Key key, this.onPressed, this.ingridient, this.onCloseTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 325.w,
        margin: EdgeInsets.symmetric(vertical: 3.w),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Get.theme.primaryColor,
              padding: EdgeInsets.all(10.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.ssp),
                  side: BorderSide(color: Get.theme.primaryColor))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 30.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: ingridient.photo != null
                            ? Image.file(
                                ingridient.photo,
                                fit: BoxFit.fill,
                              )
                            : Icon(
                                CupertinoIcons.camera,
                                color: Get.theme.primaryColor,
                              )),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Txt.h3Bold(
                    ingridient.title,
                    color: Get.theme.primaryColorDark,
                  )
                ],
              ),
              InkWell(
                onTap: onCloseTapped,
                child: Icon(
                  Icons.close_rounded,
                  color: Get.theme.primaryColorDark,
                ),
              )
            ],
          ),
        ));
  }
}
