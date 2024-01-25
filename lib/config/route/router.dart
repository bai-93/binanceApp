import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/detail_info_page/graph_detail_main.dart';
import 'package:sheker/presentation/pages/home_page/crypto_home_list_page.dart';
import 'package:sheker/presentation/pages/login_page/secondVersionloginScreen.dart';
import 'package:sheker/presentation/pages/login_page/signUp/account_creation_verification.dart';
import 'package:sheker/presentation/pages/login_page/signUp/add_mail.dart';
import 'package:sheker/presentation/pages/onboarding/onboarding.dart';
import 'package:sheker/presentation/pages/tab_bar/main_part/main_menu_tabBar.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_shimmer_page.dart';
import '../../presentation/pages/login_page/signUp/welcome.dart';

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
      initialLocation: '/sign_up',
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
        GoRoute(
            path: '/sign_up',
            builder: (context, state) {
              return SignUpWelcomeScreen();
            },
            routes: [
              GoRoute(
                path: 'account_verification',
                builder: (context, state) {
                  return SignUpAccountCreationVerification();
                },
              ),
              GoRoute(
                path: 'add_mail',
                builder: (context, state) {
                  return SignUpAddMail();
                },
              )
            ]),
        shelRouter()
      ],
    );
    return goRouter;
  }

  StatefulShellRoute shelRouter() {
    return StatefulShellRoute.indexedStack(
        // parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, router) {
          return NoTransitionPage<void>(
              child: BottomMenuTabBar(
                  router)); // here we disabled default transition
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _cryptoHomeNavigatorKey,
            routes: [
              GoRoute(
                  path: '/a',
                  builder: (context, state) {
                    return const CryptoHomePage();
                  },
                  routes: [
                    GoRoute(
                        path: 'detailInfo/:id',
                        builder: (context, state) {
                          return GraphDetailPage(state.pathParameters["id"]!);
                        })
                  ])
            ],
          ),
          StatefulShellBranch(navigatorKey: _feedNavigatorKey, routes: [
            GoRoute(
                path: '/feed',
                builder: (context, state) {
                  return Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Feed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                })
          ]),
          StatefulShellBranch(navigatorKey: _tradeNavigatorKey, routes: [
            GoRoute(
                path: '/trade',
                builder: (context, state) {
                  return Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text('Trade'),
                    ),
                  );
                })
          ]),
          StatefulShellBranch(navigatorKey: _serviceNavigatorKey, routes: [
            GoRoute(
                path: '/service',
                builder: (context, state) {
                  return Container(
                    color: Colors.deepPurpleAccent,
                    child: const Center(
                        child: Text(
                      'Services',
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
