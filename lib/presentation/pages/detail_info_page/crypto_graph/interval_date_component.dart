import 'package:flutter/material.dart';

class IntervalDateComponent extends StatefulWidget {
  void Function(String interval) data;
  IntervalDateComponent(this.data, {super.key});

  @override
  State<IntervalDateComponent> createState() => _IntervalDateComponentState();
}

class _IntervalDateComponentState extends State<IntervalDateComponent> {
  int index = 0;
  List<String> dataTitle = ['м5', 'м30', 'ч1', 'ч12', 'д1'];
  List<String> engVersionTitle = ['m5', 'm30', 'h1', 'h12', 'd1'];
  @override
  Widget build(BuildContext context) {
    return intervalOfPrice();
  }

  Widget intervalOfPrice() {
    return SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: intervalItems(),
        ));
  }

  List<Widget> intervalItems() {
    List<Widget> items = [];
    for (var i = 0; i < 5; i++) {
      items.add(content(i, dataTitle[i], radius: 20.0, width: 55.0));
      if (i < 4) {
        items.add(const SizedBox(
          width: 10.0,
        ));
      }
    }
    return items;
  }

  Widget content(int localIndex, String title,
      {bool isCircleShape = false,
      double width = 50.0,
      double height = 50.0,
      double radius = 10.0}) {
    return GestureDetector(
      onTap: () {
        debugPrint('sent event to build new graph');
        setState(() {
          index = localIndex;
        });
        widget.data(engVersionTitle[index]);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color:
                index == localIndex ? Colors.grey.shade300 : Colors.transparent,
            shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircleShape
                ? null
                : BorderRadius.all(Radius.circular(radius))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: localIndex == index ? Colors.black : Colors.grey,
              fontSize: 20.0),
        )),
      ),
    );
  }
}
