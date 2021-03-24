import 'package:get/get.dart';
import 'package:recipes_app/presentation/auth/controller/auth_controller.dart';
import 'package:recipes_app/presentation/auth/controller/user_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthController(),
    );
    Get.lazyPut(
      () => UserController(),
    );
  }
}
