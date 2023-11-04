import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';

class Providers {
  static get getProviders {
    return [
      BlocProvider<CryptoListBloc>(
          create: (context) => CryptoListBloc()..add(CryptoListLoadEvent())),
      BlocProvider<DetailInfoGraphBloc>(create: (context) {
        return DetailInfoGraphBloc();
      })
    ];
  }
}
