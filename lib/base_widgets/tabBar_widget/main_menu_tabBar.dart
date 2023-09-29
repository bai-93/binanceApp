import 'package:flutter/material.dart';
import 'package:sheker/base_widgets/tabBar_widget/bottom_menu_indicator/tab_bar_indicator.dart';

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
      Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'Главная',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Сеть',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Container(
        color: Colors.yellow,
        child: const Center(
          child: Text('Разместить что то'),
        ),
      ),
      Container(
        color: Colors.deepPurpleAccent,
        child: const Center(
            child: Text(
          'Уведомления',
          style: TextStyle(color: Colors.white),
        )),
      ),
      Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Вакансии',
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ];
    _tabController = TabController(length: stackItems.length, vsync: this);
    super.initState();
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
            indicator: DotIndicatorTabBar(color: Colors.black, radius: 2.0),
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.all(0.0),
            labelStyle: const TextStyle(fontSize: 11),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Главная',
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(icon: Icon(Icons.people), text: 'Сеть'),
              Tab(icon: Icon(Icons.plus_one_sharp), text: 'Разместить'),
              Tab(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  text: 'Уведомления'),
              Tab(
                  icon: Icon(
                    Icons.luggage_sharp,
                  ),
                  text: 'Вакансии')
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
