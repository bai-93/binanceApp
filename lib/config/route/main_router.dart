import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/route/router_manager/router_manager.dart';
import 'package:sheker/config/route/signup_router.dart';
import 'package:sheker/config/route/tabbar_routes/home/home_route.dart';
import 'package:sheker/config/route/tabbar_routes/trade/trade_router.dart';
import 'package:sheker/presentation/pages/login_page/secondVersionloginScreen.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding.dart';
import 'package:sheker/presentation/pages/tab_bar/main_part/main_menu_tabBar.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_shimmer_page.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final _signNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sign');
  final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  //bottom navigator keys
  final _cryptoHomeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'cryptoHome');
  final _feedNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'feed');
  final _tradeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'trade');
  final _serviceNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'service');
  final _walletNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'wallet');

  late final GoRouter router = configRouter();

  GoRouter configRouter() {
    GoRouter goRouter = GoRouter(
      initialLocation: '/trade/graph', //RouterPathManager.getRouterPath(),
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
            path: '/b',
            builder: (context, state) {
              return const SecondVersionLoginScreen();
            }),
        GoRoute(
          path: '/onboarding',
          builder: (context, state) {
            return const Onboarding();
          },
        ),
        SignupRouter.router,
        shelRouter(),
      ],
    );
    return goRouter;
  }

  StatefulShellRoute shelRouter() {
    return StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, router) {
          return NoTransitionPage<void>(
              child: BottomMenuTabBar(
                  router)); // here we disabled default transition
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _cryptoHomeNavigatorKey,
            routes: [HomeRoute.getRouter(key: _rootNavigatorKey)],
          ),
          StatefulShellBranch(
              navigatorKey: _feedNavigatorKey,
              routes: [TradeRouter.getRouter(key: _rootNavigatorKey)]),
          StatefulShellBranch(navigatorKey: _tradeNavigatorKey, routes: [
            GoRoute(
                path: '/market',
                builder: (context, state) {
                  return Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text('Market'),
                    ),
                  );
                })
          ]),
          StatefulShellBranch(navigatorKey: _serviceNavigatorKey, routes: [
            GoRoute(
                path: '/favorites',
                builder: (context, state) {
                  return Container(
                    color: Colors.deepPurpleAccent,
                    child: const Center(
                        child: Text(
                      'Favorites',
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                })
          ]),
          StatefulShellBranch(navigatorKey: _walletNavigatorKey, routes: [
            GoRoute(
                path: '/wallet',
                builder: (context, state) {
                  return const WalletShimmerPage();
                })
          ])
        ]);
  }
}
