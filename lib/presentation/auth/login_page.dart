import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/presentation/shared/text_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _header() => Stack(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/login_header.jpg',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('SCRATCHH'),
                        const SizedBox(
                          height: 50,
                        ),
                        Txt.h1Bold('SCRATCHHH'),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: Colors.white.withOpacity(0.25),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 285.h,
            width: 1.sw,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(90)),
                child: _header()),
          )
        ],
      ),
    );
  }
}
