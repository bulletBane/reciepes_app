import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    accentColor: Clrs.greenLighMode,
    primaryColor: Clrs.grayLightMode,
    dividerColor: Clrs.lightGrayLightMode,
    focusColor: Clrs.greenLighMode,
    scaffoldBackgroundColor: Colors.white);
ThemeData darkMode = ThemeData(
    accentColor: Clrs.greenLighMode,
    primaryColor: Clrs.grayLightMode,
    dividerColor: Clrs.lightGrayLightMode,
    focusColor: Clrs.greenLighMode,
    scaffoldBackgroundColor: Colors.white);

class Clrs {
  static const grayLightMode = Color(0xFFB606060);
  static const lightGrayLightMode = Color(0xFFBA8A8A8);
  static const greenLighMode = Color(0xFFB30BE76);
}
