import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      color: Colors.red,
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      color: Colors.red,
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
