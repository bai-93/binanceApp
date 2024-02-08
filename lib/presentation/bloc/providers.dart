import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/indicator_price_gesture_bloc/bloc/interval_price_drag_gesture_bloc.dart';
import 'package:sheker/presentation/bloc/sign_up/bloc/otp_bloc.dart';

class Providers {
  static get getProviders {
    return [
      BlocProvider<CryptoListBloc>(
          create: (context) => CryptoListBloc()..add(CryptoListLoadEvent())),
      BlocProvider<DetailInfoGraphBloc>(create: (context) {
        return DetailInfoGraphBloc();
      }),
      BlocProvider<IntervalPriceDragGestureBloc>(create: (context) {
        return IntervalPriceDragGestureBloc();
      }),
      BlocProvider<OtpBloc>(
        create: (context) {
          return OtpBloc();
        },
      )
    ];
  }
}
