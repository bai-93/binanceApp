import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/bloc/market/bloc/market_bloc.dart';
import 'package:sheker/presentation/pages/market_pages/market_main.dart';

class MarketRouter {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
      path: '/market',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => MarketBloc(),
          child: MarketMain(),
        );
      },
    );
  }
}
