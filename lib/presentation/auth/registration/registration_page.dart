import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipes_app/presentation/auth/components/buttons_bloc.dart';
import 'package:recipes_app/presentation/auth/login/login_page.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
              decoration: InputDecoration(
                hintText: nameText,
                labelText: nameText,
              ),
            ),
            _verticalBox(),
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              greenButtonData: 'Регистрация',
              flatButtonData: 'Войти',
              annotationData: 'Уже есть аккаунт?',
            )
          ],
        ),
      ),
    );
  }
}
