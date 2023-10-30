import 'package:flutter/material.dart';

class TopBalanceContentSliverBarPageView extends StatefulWidget {
  const TopBalanceContentSliverBarPageView({super.key});

  @override
  State<TopBalanceContentSliverBarPageView> createState() =>
      _TopBalanceContentSliverBarPageViewState();
}

class _TopBalanceContentSliverBarPageViewState
    extends State<TopBalanceContentSliverBarPageView> {
  bool indicatorFlag = true;
  PageController _pageController = PageController();
  int? indicator = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        indicator = _pageController.page?.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 130.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withAlpha(80)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Stack(children: [
          PageView(controller: _pageController, padEnds: false, children: [
            content('Выиграйте 100 USDT и Tesla ---> картина',
                'Для начала пригласите друзей', Colors.black),
            content('Хаб для новых пользователей ---> картина',
                'Получите приветственную награду', Colors.yellow)
          ]),
          indicatorSlide()
        ]),
      ),
    );
  }

  Widget content(String topTitle, String description, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topTitle,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black.withAlpha(150),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  description,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 10.0),
            child: Container(
              color: color,
              width: 90.0,
              height: 100.0,
            ),
          )
        ],
      ),
    );
  }

  Widget indicatorSlide() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: containerSkewTransform()),
      ),
    );
  }

  List<Widget> containerSkewTransform() {
    List<Widget> data = [];
    for (var index = 0; index < 2; index++) {
      Widget item = Transform(
        transform: Matrix4.skewX(-0.3),
        child: Container(
          color: indicator == index ? Colors.black : Colors.grey,
          width: 15.0,
          height: 6.0,
        ),
      );
      data.add(item);
      data.insert(
          1,
          const SizedBox(
            width: 3.0,
          ));
    }
    return data;
  }
}
