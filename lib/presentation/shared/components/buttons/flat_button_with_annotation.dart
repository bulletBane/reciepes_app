import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../text_widgets.dart';

class FlatButtonWithAnnotation extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  final String annotationData;

  const FlatButtonWithAnnotation(
      {Key key,
      @required this.onPressed,
      @required this.data,
      this.annotationData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool annotationIsNotNull = annotationData != null;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          annotationIsNotNull
              ? Txt.h4(
                  annotationData,
                  color: Theme.of(context).hintColor,
                )
              : Container(),
          InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Txt.h3(
                  data,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ],
      ),
    );
  }
}
