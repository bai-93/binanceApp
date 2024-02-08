import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/sign_up/bloc/otp_bloc.dart';

class OtpImageAnimation extends StatefulWidget {
  const OtpImageAnimation({super.key});
  @override
  State<OtpImageAnimation> createState() => _OtpImageAnimationState();
}

class _OtpImageAnimationState extends State<OtpImageAnimation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpBloc, OtpState>(builder: ((context, state) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: state is OtpInitialState || state is OtpSuccessState
            ? image(state.nameOfImage)
            : image(state.nameOfImage),
      );
    }));
  }

  Widget image(String name) {
    return Image.asset(
      name,
      width: 57.0,
      height: 60.0,
      key: UniqueKey(),
    );
  }
}
