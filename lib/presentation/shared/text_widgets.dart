import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt {
  static Widget h1(String text, {Color color, TextOverflow textOverflow}) =>
      Text(text,
          overflow: textOverflow,
          style: GoogleFonts.nunito(
              color: color, fontSize: 24.ssp, fontWeight: FontWeight.w400));
  static Widget h1Bold(String text, {Color color, TextOverflow textOverflow}) =>
      Text(text,
          overflow: textOverflow,
          style: GoogleFonts.nunito(
              color: color, fontSize: 24.ssp, fontWeight: FontWeight.w700));
}
