import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/base_widgets/baseWidget.dart';
import 'login_shape/login_top_bottom.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen>
    with BaseScreenMixin, SingleTickerProviderStateMixin {
  VoidCallback? signUp;
  late AnimationController controller;
  late Tween<double> opacityTween;
  late Animation opacity;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    opacity = opacityTween.animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
                                        debugPrint("top left action");
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
                child: Opacity(
                  opacity: opacity.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createButton(
                          func: opacity.value >= 0.0
                              ? () {
                                  debugPrint('Sign up button');
                                }
                              : () {},
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
    );
  }
}
