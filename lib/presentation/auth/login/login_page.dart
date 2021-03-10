import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/auth/components/buttons_bloc.dart';
import 'package:recipes_app/presentation/auth/registration/registration_page.dart';
import 'package:recipes_app/presentation/shared/components/buttons/flat_button_with_annotation.dart';
import 'package:recipes_app/presentation/shared/components/buttons/green_flat_button.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  static const double _paddingHorizontal = 15;
  Widget _header() => Column(
        children: [
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
                      Image.asset(
                        'assets/login_header.jpg',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.4),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: _paddingHorizontal),
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
                            Txt.h1Bold('Добро пожаловать!',
                                color: Colors.black),
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
            ),
          ),
          _verticalBox(),
        ],
      );

  Widget _loginToContinue() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: _paddingHorizontal),
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
  Form _loginForm() {
    String loginText = 'Введите ваш логин';
    String passwordText = 'Введите ваш пароль';
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: loginText,
                labelText: loginText,
              ),
            ),
            _verticalBox(),
            TextFormField(
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
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _loginToContinue(),
            _loginForm(),
            ButtonsBlock(
              onGreenButtonPressed: () {},
              onFlatButtonPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => RegistrationPage()));
              },
              greenButtonData: 'Вход',
              flatButtonData: 'Создать аккаунт',
              annotationData: 'Нет аккаунта?',
            )
          ],
        ),
      ),
    );
  }
}
