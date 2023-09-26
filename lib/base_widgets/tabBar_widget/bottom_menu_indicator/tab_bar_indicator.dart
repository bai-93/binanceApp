import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class BottomMenuTabBar extends StatefulWidget {
  const BottomMenuTabBar({super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar> {
  final ScrollController _homeController = ScrollController();
  int previousIndex = 0;
  late List<Widget> stackItems = [];
  @override
  void initState() {
    stackItems = [
      ScrollScreen(
        key: ValueKey(1),
      ),
      Container(
        color: Colors.deepPurpleAccent,
      )
    ];
    super.initState();
  }

  Widget _listViewBody() {
    return ListView.separated(
        controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              'Item $index',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              thickness: 2,
            ),
        itemCount: 50);
  }

  List<BottomNavigationBarItem> items() {
    BottomNavigationBarItem item1 =
        BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: 'page1');
    BottomNavigationBarItem item2 =
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'page2');
    return [item1, item2];
  }

  void changeOrderOfStack(int indexItem) {
    if (previousIndex != indexItem) {
      setState(() {
        Widget firstItem = stackItems[previousIndex];
        Widget nextItem = stackItems[indexItem];
        stackItems[previousIndex] = nextItem;
        stackItems[indexItem] = firstItem;
        previousIndex = indexItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: stackItems),
        bottomNavigationBar: BottomNavigationBar(
          items: items(),
          onTap: (value) {
            // debugPrint('index item === ${value.toString()}');
            changeOrderOfStack(value);
          },
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
                'Index $index',
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
