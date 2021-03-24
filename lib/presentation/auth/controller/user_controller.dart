import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = Rx<UserModel>();

  UserModel get user => _userModel.value;

  set user(UserModel model) => _userModel.value = model;

  void clear() {
    _userModel.value = UserModel();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
