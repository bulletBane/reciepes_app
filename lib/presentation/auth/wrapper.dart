import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recipes_app/presentation/auth/controller/auth_controller.dart';
import 'package:recipes_app/presentation/auth/login/login_page.dart';
import 'package:recipes_app/presentation/home/home.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) =>
      Obx(() => controller.user != null ? Home() : LoginPage());
}
