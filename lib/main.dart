import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/auth/login_page.dart';
import 'package:recipes_app/presentation/shared/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AdaptiveThemeMode savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => AdaptiveTheme(
        light: lightMode,
        dark: darkMode,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (lightMode, darkMode) => MaterialApp(
            debugShowCheckedModeBanner: false,
            // title: 'Recipes App',
            theme: lightMode,
            darkTheme: darkMode,
            home: LoginPage()),
      ),
    );
  }
}
