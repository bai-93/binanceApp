import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/pages/tab_bar/main_part/tab_index_observable.dart';
import 'package:sheker/utilities/app_colors.dart';

class BottomMenuTabBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomMenuTabBar(this.navigationShell, {super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar>
    with SingleTickerProviderStateMixin {
  TabIndexObserver observer = getIt<TabIndexObserver>();
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: widget.navigationShell.currentIndex,
        length: 5,
        vsync: this);

    observer.callback = (value) {
      _tabController.index = value;
      index = value;
      widget.navigationShell.goBranch(value,
          initialLocation: value == widget.navigationShell.currentIndex);
    };
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: widget.navigationShell,
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelPadding: const EdgeInsets.all(0.0),
          labelStyle: const TextStyle(fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          controller: _tabController,
          tabs: [
            Tab(
                icon: makeImage(
                    'home',
                    index == 0
                        ? AppColorsUtility.onboardingPrimary
                        : AppColorsUtility.secondary),
                child: makeText(
                    'Home',
                    index == 0
                        ? AppColorsUtility.onboardingPrimary
                        : AppColorsUtility.secondary)),
            Tab(
              icon: makeImage(
                  'trade',
                  index == 1
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
              child: makeText(
                  'Trade',
                  index == 1
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
            ),
            Tab(
              icon: makeImage(
                  'market',
                  index == 2
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
              child: makeText(
                  'Market',
                  index == 2
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
            ),
            Tab(
              icon: makeImage(
                  'favorite',
                  index == 3
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
              child: makeText(
                  'Favorites',
                  index == 3
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
            ),
            Tab(
              icon: makeImage(
                  'wallet',
                  index == 4
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
              child: makeText(
                  'Wallet',
                  index == 4
                      ? AppColorsUtility.onboardingPrimary
                      : AppColorsUtility.secondary),
            )
          ],
          onTap: (value) {
            {
              _tabController.index = value;
              index = value;
              widget.navigationShell.goBranch(value,
                  initialLocation:
                      value == widget.navigationShell.currentIndex);
            }
          },
        ));
  }

  Widget makeText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 12),
    );
  }

  Widget makeImage(String nameImage, Color color) {
    return Image.asset('lib/images/tabbar/$nameImage.png', color: color);
  }
}
