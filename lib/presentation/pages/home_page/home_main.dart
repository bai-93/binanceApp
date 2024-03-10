import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/home_page/balance/balance.dart';

class HomeMain extends BaseScreenStateless {
  HomeMain({super.key});

  @override
  Widget? leadingAppBar() {
    return IconButton(
        onPressed: () {
          debugPrint("leading");
        },
        icon: Image.asset('lib/images/home/profile.png'));
  }

  @override
  List<Widget>? actionsAppBar() {
    return [
      IconButton(
          onPressed: () {
            buildContext?.push('/home/settings/');
          },
          icon: Image.asset('lib/images/home/settings.png')),
    ];
  }

  @override
  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    return super.typeOfAppbar(type: AppbarType.signUp);
  }

  @override
  Widget body(BuildContext context) {
    return const Column(
      children: [BalanceGraph()],
    );
  }
}
