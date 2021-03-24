import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recipes_app/presentation/auth/components/buttons_bloc.dart';
import 'package:recipes_app/presentation/auth/controller/auth_controller.dart';
import 'package:recipes_app/presentation/auth/login/login_page.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class RegistrationPage extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();
  static const double _paddingHorizontal = 15;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header('Добро пожаловать'),
              _loginToContinue(),
              _loginForm(),
              ButtonsBlock(
                onGreenButtonPressed: () {
                  controller.signUp(
                      email: loginController.text,
                      password: passwordController.text,
                      name: nameController.text);
                },
                onFlatButtonPressed: () {
                  Get.to(LoginPage());
                },
                greenButtonData: 'Регистрация',
                flatButtonData: 'Войти',
                annotationData: 'Уже есть аккаунт?',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginToContinue() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: _paddingHorizontal),
            child: Txt.h4('Создайте аккаунт, что бы продолжить'),
          ),
          _bigVerticalBox(),
        ],
      );
  Widget _verticalBox() => const SizedBox(
        height: 10,
      );
  Widget _bigVerticalBox() => const SizedBox(
        height: 25,
      );
  Form _loginForm() {
    String nameText = 'Имя';
    String loginText = 'Логин';
    String passwordText = 'Пароль';
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: nameText,
                labelText: nameText,
              ),
            ),
            _verticalBox(),
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(
                hintText: loginText,
                labelText: loginText,
              ),
            ),
            _verticalBox(),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: passwordText,
                labelText: passwordText,
              ),
            ),
            _bigVerticalBox(),
            _verticalBox()
          ],
        ),
      ),
    );
  }
}
