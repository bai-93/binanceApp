import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CryptoGraphShimmer extends StatelessWidget {
  const CryptoGraphShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                        topAppbar(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        graphContent(),
                        const SizedBox(
                          height: 30.0,
                        )
                      ] +
                      info(),
                ),
              )),
        ),
      ),
    );
  }

  Widget topAppbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(children: [
        content(width: 40.0, height: 40.0, isCircleShape: true),
        const Spacer(),
        content(width: 40.0, height: 40.0, isCircleShape: true),
        const SizedBox(
          width: 20.0,
        ),
        content(width: 40.0, height: 40.0, isCircleShape: true),
      ]),
    );
  }

  Widget graphContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        content(radius: 20.0, height: 40.0, width: 100.0),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Expanded(
              child: content(radius: 20.0, height: 40.0),
            ),
            const Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: 10.0,
                )),
            content(isCircleShape: true)
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(child: content(radius: 20.0, height: 200.0)),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [Expanded(child: content(radius: 20.0, height: 55.0))],
        )
      ],
    );
  }

  List<Widget> info() {
    List<Widget> items = [];
    Row rowItems = Row(
      children: [
        Expanded(flex: 2, child: content(height: 55.0, radius: 20.0)),
        const Spacer(),
        content(isCircleShape: true)
      ],
    );
    for (var i = 0; i < 5; i++) {
      items.add(rowItems);
      items.add(const SizedBox(
        height: 15.0,
      ));
    }
    return items;
  }

  Widget content(
      {bool isCircleShape = false,
      double width = 50.0,
      double height = 50.0,
      double radius = 10.0}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              isCircleShape ? null : BorderRadius.all(Radius.circular(radius))),
    );
  }
}
