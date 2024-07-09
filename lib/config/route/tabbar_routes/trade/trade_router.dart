import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/trade_page/trade_main.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/graph_of_coin/graph_coin_main.dart';

class TradeRouter {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
        path: '/trade',
        builder: (context, state) {
          return const TradeMain();
        },
        routes: [
          GoRoute(
            parentNavigatorKey: key,
            path: 'graph',
            builder: (context, state) {
              // if (state.extra is int) {
              return GraphOfCoinMain(0);
              // }
              // return Container(color: Colors.blue,);
            },
          )
        ]);
  }
}
