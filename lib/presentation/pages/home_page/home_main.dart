import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/home_page/balance/balance.dart';
import 'package:sheker/presentation/pages/home_page/market_movers/market_mover.dart';
import 'package:sheker/presentation/pages/home_page/shimmer/balance_shimmer.dart';
import 'package:sheker/presentation/pages/home_page/shimmer/market_mover_shimmer.dart';
import 'package:sheker/presentation/pages/home_page/shimmer/portfolio_shimmer.dart';

class HomeMain extends BaseScreen {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends BaseScreenState<HomeMain> with BaseScreenMixin {
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
            context.push('/home/settings/');
          },
          icon: Image.asset('lib/images/home/settings.png')),
    ];
  }

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.signUp);
  }

  @override
  Widget body() {
    return Column(
      children: [BalanceShimmer(), MarketMovers(), PortfolioShimmer()],
    );
  }
}
