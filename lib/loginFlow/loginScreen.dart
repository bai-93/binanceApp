import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/baseUI/baseWidget.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen>
    with BaseScreenMixin {
  @override
  Widget body() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 600.0,
            ),
            Container(
              color: Colors.yellow,
              width: 100.0,
              height: 100.0,
            )
          ]),
        ),
      ),
    );
  }
}
