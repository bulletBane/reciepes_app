import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  static const double _paddingHorizontal = 15;
  Widget _header() => Container(
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
                        Txt.h1Bold('SCRATCHHH', color: Colors.black),
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
      );

  Widget _loginToContinue() => Padding(
        padding: const EdgeInsets.only(left: _paddingHorizontal),
        child: Txt.h4('Пожалуйста, войдите, что бы продолжить'),
      );
  Widget _verticalBox() => const SizedBox(
        height: 10,
      );
  Form _loginForm() {
    String loginText = 'Введите ваш логин';
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
            TextFormField()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_header(), _verticalBox(), _loginToContinue(), _loginForm()],
      ),
    );
  }
}
