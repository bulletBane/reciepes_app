import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_app/presentation/auth/components/buttons_bloc.dart';
import 'package:recipes_app/presentation/auth/registration/registration_page.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

import '../controller/auth_controller.dart';

class LoginPage extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();
  static const double _paddingHorizontal = 15;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _loginToContinue() => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: _paddingHorizontal,
            ),
            child: Txt.h4('Пожалуйста, войдите, что бы продолжить'),
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
  Widget _loginForm() {
    String loginText = 'Введите ваш логин';
    String passwordText = 'Введите ваш пароль';
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: Column(
          children: [
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                hintText: loginText,
                labelText: loginText,
              ),
            ),
            _verticalBox(),
            TextFormField(
              controller: _passwordController,
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
              Header('Добро пожаловать!'),
              _loginToContinue(),
              _loginForm(),
              ButtonsBlock(
                onGreenButtonPressed: () {
                  controller.signIn(
                      email: _loginController.text,
                      password: _passwordController.text);
                },
                onFlatButtonPressed: () {
                  Get.to(RegistrationPage());
                },
                greenButtonData: 'Вход',
                flatButtonData: 'Создать аккаунт',
                annotationData: 'Нет аккаунта?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends GetWidget<AuthController> {
  final String title;
  static const double _paddingHorizontal = 15;

  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.visible.isTrue
        ? Container(
            height: 30.h,
          )
        : Column(children: [
            Container(
                height: 285.h,
                width: 1.sw,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(90)),
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 285.h,
                            width: 1.sw,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(90)),
                              child: Image.asset(
                                'assets/login_header.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.4),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: _paddingHorizontal),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Txt.h1Bold('SMTTT', color: Colors.black),
                                const SizedBox(
                                  height: 50,
                                ),
                                Txt.h1Bold(title, color: Colors.black),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            )
          ]));
  }
}
