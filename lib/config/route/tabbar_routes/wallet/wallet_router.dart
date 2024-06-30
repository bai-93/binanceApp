import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_main.dart';

class WalletRouter {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
      path: '/wallet',
      builder: (context, state) {
        return const WalletMain();
      },
    );
  }
}
