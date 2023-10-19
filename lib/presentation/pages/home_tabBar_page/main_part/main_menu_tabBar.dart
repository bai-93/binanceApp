import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/network_layer/dio_client.dart';
import 'package:sheker/network_layer/retofit_layer/rest_client.dart';
import 'package:sheker/presentation/pages/home_tabBar_page/bottom_menu_indicator/tab_bar_indicator.dart';

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
      FirstPage(),
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
      Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Wallets',
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
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

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  final ScrollController _homeController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          key: const ValueKey('value'),
          controller: _homeController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text(
                'Index ${index + 1}',
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                thickness: 2,
              ),
          itemCount: 50),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    apiTest();
    super.initState();
  }

  void apiTest() async {
    final client =
        getIt<ApiClientRetrofit>();
    final data = await client.getCryptoCurrencies();
    print(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Главная',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
