import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:recipes_app/data/models/user_model.dart';
import 'package:recipes_app/data/repo/user_db.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/auth/controller/user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserDB _userDB = UserDB();

  Rx<User> _firebaseUser = Rx<User>();
  RxBool visible = false.obs;

  get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool value) {
      visible.value = value;
    });
    super.onInit();
  }

  void signIn({@required email, @required password}) async {
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          await _userDB.getUser(credentials.user.uid);
    } catch (e) {
      Get.snackbar('Ошибка регистрации', e.toString(),
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white,
          backgroundColor: Colors.grey[900],
          margin: EdgeInsets.all(15.w),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() {
    _auth.signOut();
    Get.find<UserController>().clear();
  }

  void signUp(
      {@required String email,
      @required String password,
      @required String name}) async {
    print("STARTED");
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel =
          UserModel(uid: credential.user.uid, name: name, email: email);
      if (await _userDB.createNewUser(userModel)) {
        Get.find<UserController>().user = userModel;
        Get.back();
      }
    } catch (e) {
      Get.snackbar('Ошибка регистрации', e.toString(),
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white,
          backgroundColor: Colors.grey[900],
          margin: EdgeInsets.all(15.w),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
