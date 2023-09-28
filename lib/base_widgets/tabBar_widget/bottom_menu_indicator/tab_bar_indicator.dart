import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class BottomMenuTabBar extends StatefulWidget {
  const BottomMenuTabBar({super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar> {
  int selectedIndexStack = 0;
  late List<Widget> stackItems = [];

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
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 11.0,
            unselectedFontSize: 11.0,
            currentIndex: selectedIndexStack,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Главная'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Сеть'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.plus_one_sharp), label: 'Разместить'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Уведомления',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.luggage_sharp,
                ),
                label: 'Вакансии',
              )
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
