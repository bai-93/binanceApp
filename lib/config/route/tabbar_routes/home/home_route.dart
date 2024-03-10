import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/home_page/home_main.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings.dart';

class HomeRoute {
  static GoRoute router = GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeMain();
      },
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) {
            return Settings();
          },
        )
      ]);
}

// GoRoute(
//                   path: '/home',
//                   builder: (context, state) {
//                     return const CryptoHomePage();
//                   },
//                   routes: [
//                     GoRoute(
//                         path: 'detailInfo/:id',
//                         builder: (context, state) {
//                           return GraphDetailPage(state.pathParameters["id"]!);
//                         })
//                   ])
