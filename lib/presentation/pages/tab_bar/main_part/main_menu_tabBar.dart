import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/tab_bar/bottom_menu_indicator/tab_bar_indicator.dart';
import 'package:sheker/utilities/app_colors.dart';

class BottomMenuTabBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomMenuTabBar(this.navigationShell, {super.key});

  @override
  State<BottomMenuTabBar> createState() => _BottomMenuTabBarState();
}

class _BottomMenuTabBarState extends State<BottomMenuTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: widget.navigationShell,
        bottomNavigationBar: TabBar(
          indicator: const DotIndicatorTabBar(color: Colors.black, radius: 2.0),
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
                        ? AppColors.onboardingPrimary
                        : AppColors.secondary),
                child: makeText(
                    'Home',
                    index == 0
                        ? AppColors.onboardingPrimary
                        : AppColors.secondary)),
            Tab(
              icon: makeImage(
                  'trade',
                  index == 1
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
              child: makeText(
                  'Trade',
                  index == 1
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
            ),
            Tab(
              icon: makeImage(
                  'market',
                  index == 2
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
              child: makeText(
                  'Market',
                  index == 2
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
            ),
            Tab(
              icon: makeImage(
                  'favorite',
                  index == 3
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
              child: makeText(
                  'Favorites',
                  index == 3
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
            ),
            Tab(
              icon: makeImage(
                  'wallet',
                  index == 4
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
              child: makeText(
                  'Wallet',
                  index == 4
                      ? AppColors.onboardingPrimary
                      : AppColors.secondary),
            )
          ],
          onTap: (value) {
            {
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
