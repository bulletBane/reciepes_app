import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData.light().copyWith(
  primaryColorLight: Clrs.grayLightMode,
  // focusColor: Clrs.greenLighMode,
  hintColor: Clrs.grayLightMode,
  primaryColor: Clrs.greenLighMode,
  hoverColor: Clrs.grayLightMode,
  appBarTheme: AppBarTheme(color: Colors.white),
  accentColor: Clrs.greenLighMode,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColorDark: Colors.black,
  focusColor: Clrs.grayLightMode,
);
ThemeData darkMode = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(color: Color(0xFF323232)),
  primaryColor: Color(0xFFBEC0FF),
  backgroundColor: Color(0xFF3A3A3A),
  scaffoldBackgroundColor: Color(0xFF323232),
  primaryColorDark: Colors.white,
  primaryColorLight: Color(0xFF00C48C),
  hoverColor: Colors.white,
);

class Clrs {
  static const grayLightMode = Color(0xFF606060);
  static const lightGrayLightMode = Color(0xFFA8A8A8);
  static const greenLighMode = Color(0xFF30BE76);
}
