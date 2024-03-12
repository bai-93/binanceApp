import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/home_page/home_main.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings.dart';

import '../../../../presentation/pages/detail_info_page/graph_detail_main.dart';
import '../../../../presentation/pages/home_page/crypto_home_list_page.dart';

class HomeRoute {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
        path: '/home',
        builder: (context, state) {
          return HomeMain();
        },
        routes: [
          GoRoute(
            parentNavigatorKey: key,
            path: 'settings',
            builder: (context, state) {
              return Settings();
            },
          ),
          GoRoute(
              path: 'crypto',
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
        ]);
  }
}
