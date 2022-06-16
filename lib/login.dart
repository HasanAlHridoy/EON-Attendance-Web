// import 'dart:ui';

import 'package:attendance_app/Services/constants.dart';
import 'package:attendance_app/widgets/form.dart';
import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ResponsiveWidget(
        smallScreen: Center(
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(blurRadius: 25.0),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 1.5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                        // SizedBox(
                        //   height: 24.0,
                        // ),
                        FormScreen(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        mediumScreen: Center(
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(blurRadius: 25.0),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 2.8,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 28.0,
                            ),
                          ),
                          // SizedBox(
                          //   height: 24.0,
                          // ),
                          FormScreen(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        largeScreen: Center(
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(blurRadius: 25.0),
                    ]),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 28.0,
                            ),
                          ),
                          // SizedBox(
                          //   height: 24.0,
                          // ),
                          FormScreen(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
