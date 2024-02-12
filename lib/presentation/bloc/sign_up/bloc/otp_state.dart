part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  String nameOfImage;
  OtpState({this.nameOfImage = 'lib/images/login/signup/mail_closed.png'});

  @override
  List<Object> get props => [];
}

final class OtpInitialState extends OtpState {
  OtpInitialState() : super();
}

final class OtpSendState extends OtpState {}

class OtpSuccessState extends OtpState {
  OtpSuccessState()
      : super(nameOfImage: 'lib/images/login/signup/mail_opened.png');

  @override
  List<Object> get props => [nameOfImage];
}
