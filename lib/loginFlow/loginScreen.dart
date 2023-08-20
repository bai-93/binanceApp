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
  VoidCallback? signUp;
  @override
  Widget body() {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: [
            gradientContainer(
                [Colors.white, Colors.white], getSizeScreen().height),
            Positioned(
              top: getSizeScreen().height * 0.2,
              child: Container(
                color: Colors.white,
                width: getSizeScreen().width,
                height: getSizeScreen().height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Password')),
                      const SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () {
                          debugPrint('sign in');
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(
                                  Icons.arrow_right_alt_rounded,
                                  color: Colors.green,
                                  size: 40.0,
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            gradientContainer([
              const Color.fromARGB(255, 103, 210, 140),
              const Color.fromARGB(255, 50, 193, 178)
            ], getSizeScreen().height * 0.1),
            Positioned(
                top: 0.0,
                left: 0.0,
                child: ClipPath(
                  clipper: TopContentClip(),
                  child: Container(
                      color: const Color.fromARGB(255, 35, 38, 65),
                      width: getSizeScreen().width,
                      height: getSizeScreen().height * 0.5,
                      child: Stack(
                        children: [
                          const Positioned(
                            top: 80.0,
                            left: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('Back',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        debugPrint(
                                            'welcome back RIGHT_TOP_button');
                                      },
                                      child: const Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    )
                                  ]),
                            ]),
                          )
                        ],
                      )),
                )),
            Positioned(
              bottom: 0.0,
              child: ClipPath(
                clipper: BottomContentClip(),
                child: gradientContainer([
                  const Color.fromARGB(255, 103, 210, 140),
                  const Color.fromARGB(255, 50, 193, 178)
                ], getSizeScreen().height * 0.27),
              ),
            ),
            Positioned(
              bottom: getSizeScreen().height * 0.05,
              child: SizedBox(
                width: getSizeScreen().width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createButton(
                        func: () {
                          debugPrint('Sign up button');
                        },
                        child: Text(
                          'Sign up',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                    createButton(
                        func: () {
                          debugPrint('forgot password button');
                        },
                        child: Text(
                          'Forgot Password',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  Container gradientContainer(List<Color> gradientColors, double heigh,
      {Color? color}) {
    return Container(
      width: getSizeScreen().width,
      height: heigh,
      color: color,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topRight,
            end: Alignment.topLeft),
      ),
    );
  }

  TextButton createButton({required Function()? func, required Widget child}) {
    return TextButton(
      onPressed: func,
      child: child,
      // style: TextButton.styleFrom(),
    );
  }
}

class TopContentClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    path.moveTo(0.0, height * 0.7);
    path.quadraticBezierTo(width * 0.2, height, width * 0.45, height * 0.6);
    path.quadraticBezierTo(width * 0.65, height * 0.2, width, height * 0.45);
    path.lineTo(width, 0.0);
    path.lineTo(width * 0.78, 0.0);
    path.quadraticBezierTo(width * 0.69, height * 0.15, width * 0.55, 20.0);
    path.quadraticBezierTo(width * 0.42, -20.0, width * 0.31, height * 0.1);
    path.quadraticBezierTo(
        width * 0.23, height * 0.2, width * 0.16, height * 0.15);
    path.quadraticBezierTo(width * 0.1, height * 0.09, 10.0, height * 0.15);
    path.lineTo(0.0, height * 0.17);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomContentClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var pathClip = Path();
    pathClip.moveTo(0.0, height * 0.23);
    pathClip.quadraticBezierTo(
        width * 0.16, height * 0.4, width * 0.4, height * 0.2);
    pathClip.quadraticBezierTo(width * 0.75, -10.0, width, height * 0.2);
    pathClip.lineTo(width, height);
    pathClip.lineTo(0.0, height);
    pathClip.close();
    return pathClip;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//35 38 65  top content color
