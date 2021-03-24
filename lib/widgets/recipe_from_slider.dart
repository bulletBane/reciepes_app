import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeFromSlider extends StatefulWidget {
  @override
  _RecipeFromSliderState createState() => _RecipeFromSliderState();
}

class _RecipeFromSliderState extends State<RecipeFromSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 556.h,
      width: 295.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.ssp),
      ),
      child: Column(
        children: [
          SizedBox(
              height: 62,
              width: 295.w,
              child: Row(
                children: [CircleAvatar()],
              ))
        ],
      ),
    );
  }
}
