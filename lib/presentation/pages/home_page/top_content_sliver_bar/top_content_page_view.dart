import 'package:flutter/material.dart';

class TopContentSliverBarPageView extends StatefulWidget {
  const TopContentSliverBarPageView({super.key});

  @override
  State<TopContentSliverBarPageView> createState() =>
      _TopContentSliverBarPageViewState();
}

class _TopContentSliverBarPageViewState
    extends State<TopContentSliverBarPageView> {
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
        child: PageView(
          reverse: false,
          children: [
            content('Выиграйте 100 USDT и Tesla',
                'Для начала\nпригласите друзей', Colors.black),
            content('Хаб для новых пользователей',
                'Получите\nпривественную награду', Colors.yellow)
          ],
        ),
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
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              color: color,
              width: 100.0,
              height: 100.0,
            ),
          )
        ],
      ),
    );
  }
}
