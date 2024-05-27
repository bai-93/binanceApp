import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/trade_page/trade_main.dart';

class TradeRouter {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
      path: '/trade',
      builder: (context, state) {
        return const TradeMain();
      },
      routes: [
        
      ]
    );
  }
}
