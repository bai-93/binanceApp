import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/home_page/crypto_home_list_page.dart';
import 'package:sheker/presentation/pages/tab_bar/bottom_menu_indicator/tab_bar_indicator.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_shimmer_page.dart';

class BottomMenuTabBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomMenuTabBar(this.navigationShell, {super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: widget.navigationShell.currentIndex,
        length: 5,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: widget.navigationShell,
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: TabBar(
            indicator:
                const DotIndicatorTabBar(color: Colors.black, radius: 2.0),
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.all(0.0),
            labelStyle: const TextStyle(fontSize: 11),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(icon: Icon(Icons.feed), text: 'Feed'),
              Tab(icon: Icon(Icons.money), text: 'Trade'),
              Tab(
                  icon: Icon(
                    Icons.room_service_sharp,
                  ),
                  text: 'Services'),
              Tab(
                  icon: Icon(
                    Icons.wallet,
                  ),
                  text: 'Wallets')
            ],
            onTap: (value) {
              {
                widget.navigationShell.goBranch(value,
                    initialLocation:
                        value == widget.navigationShell.currentIndex);
              }
            },
          ),
        ));
  }
}
