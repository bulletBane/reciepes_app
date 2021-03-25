import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt extends Text {
  Txt(String data,
      {Color color,
      TextOverflow textOverflow,
      FontWeight fontWeight,
      double fontSize})
      : super(data,
            overflow: textOverflow,
            style: GoogleFonts.nunito(
                color: color, fontSize: fontSize, fontWeight: fontWeight));

  factory Txt.h1(String data,
          {Color color,
          TextOverflow textOverflow,
          FontWeight fontWeight,
          double fontSize}) =>
      Txt(
        data,
        color: color,
        textOverflow: textOverflow,
        fontSize: 24.ssp,
        fontWeight: FontWeight.w400,
      );

  factory Txt.h1Bold(String data,
          {Color color,
          TextOverflow textOverflow,
          FontWeight fontWeight,
          double fontSize}) =>
      Txt(
        data,
        color: color,
        textOverflow: textOverflow,
        fontSize: 24.ssp,
        fontWeight: FontWeight.w700,
      );
  factory Txt.h4(String data,
          {Color color,
          TextOverflow textOverflow,
          FontWeight fontWeight,
          double fontSize}) =>
      Txt(
        data,
        color: color,
        textOverflow: textOverflow,
        fontSize: 14.ssp,
        fontWeight: FontWeight.w400,
      );
  factory Txt.h3(String data,
          {Color color,
          TextOverflow textOverflow,
          FontWeight fontWeight,
          double fontSize}) =>
      Txt(
        data,
        color: color,
        textOverflow: textOverflow,
        fontSize: 16.ssp,
        fontWeight: FontWeight.w400,
      );
  factory Txt.h3Bold(String data,
          {Color color,
          TextOverflow textOverflow,
          FontWeight fontWeight,
          double fontSize}) =>
      Txt(
        data,
        color: color,
        textOverflow: textOverflow,
        fontSize: 16.ssp,
        fontWeight: FontWeight.w700,
      );
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
