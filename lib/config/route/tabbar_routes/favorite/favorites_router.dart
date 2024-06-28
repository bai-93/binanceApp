import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/favorites_page/favorites_main.dart';

class FavoritesRouter {
  static GoRoute getRouter({GlobalKey<NavigatorState>? key}) {
    return GoRoute(
      path: '/favorites',
      builder: (context, state) {
        return const FavoritesMain();
      },
    );
  }
}
