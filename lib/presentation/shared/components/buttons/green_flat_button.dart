import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../text_widgets.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;

  const GreenButton({Key key, this.onPressed, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 325.w,
        height: 50.h,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.ssp)),
            ),
            onPressed: onPressed,
            child: Txt.h3Bold(
              data,
              color: Colors.white,
            )),
      ),
    );
  }
}
