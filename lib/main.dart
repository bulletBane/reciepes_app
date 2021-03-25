import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/repo/recipes_repo.dart';
import 'package:recipes_app/presentation/auth/wrapper.dart';
import 'package:recipes_app/presentation/shared/theme_data.dart';
import 'package:recipes_app/presentation/auth/bin/auth_binding.dart';
import 'package:recipes_app/services/routing_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
    RecipesRepo().getRecipesList();
    return ScreenUtilInit(
      designSize: Size(372, 812),
      allowFontScaling: false,
      builder: () => FutureBuilder(
        // Initialize FlutterFire:
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Unable to load');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return AdaptiveTheme(
                light: lightMode,
                dark: darkMode,
                initial: savedThemeMode ?? AdaptiveThemeMode.system,
                builder: (theme, darkTheme) => GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: theme,
                      darkTheme: darkTheme,
                      initialBinding: AuthBinding(),
                      home: Wrapper(),
                      getPages: RoutingService.routes,
                    ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
