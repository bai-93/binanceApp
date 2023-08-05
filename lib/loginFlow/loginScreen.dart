import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 500.0,
              ),
              Text('Login Screen',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                height: 500.0,
              ),
              GestureDetector(
                onTap: () {
                  AdaptiveTheme.of(context).setDark();
                },
                child: Container(
                  color: Colors.yellowAccent,
                  width: 100.0,
                  height: 100.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
