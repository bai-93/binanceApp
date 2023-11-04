import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/home_page/crypto_home_list_page.dart';
import 'package:sheker/presentation/pages/tab_bar/bottom_menu_indicator/tab_bar_indicator.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_shimmer_page.dart';

class BottomMenuTabBar extends StatefulWidget {
  const BottomMenuTabBar({super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar>
    with SingleTickerProviderStateMixin {
  int selectedIndexStack = 0;
  late List<Widget> stackItems = [];
  late TabController _tabController;

  @override
  void initState() {
    stackItems = [
      const CryptoHomePage(),
      Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Feed',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Container(
        color: Colors.yellow,
        child: const Center(
          child: Text('Trade'),
        ),
      ),
      Container(
        color: Colors.deepPurpleAccent,
        child: const Center(
            child: Text(
          'Services',
          style: TextStyle(color: Colors.white),
        )),
      ),
      WalletShimmerPage()
    ];
    _tabController = TabController(length: stackItems.length, vsync: this);
    _tabController.addListener(() {
      debugPrint('tab bar controller LISTENER === ${_tabController.index}');
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: IndexedStack(index: selectedIndexStack, children: stackItems),
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
                setState(() {
                  selectedIndexStack = value;
                });
              }
            },
          ),
        ));
  }
}
