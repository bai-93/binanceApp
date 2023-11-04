import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class WalletShimmerPage extends StatelessWidget {
  const WalletShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              topContent(),
              const SizedBox(
                height: 10.0,
              ),
              topContent(),
              const SizedBox(height: 40.0),
              middleContent(),
              const SizedBox(
                height: 30.0,
              ),
              graphContent()
            ],
          ),
        ),
      ),
    ));
  }

  Widget topContent() {
    return Row(
      children: [
        Expanded(child: content(height: 35.0)),
        const SizedBox(
          width: 10.0,
        ),
        Flexible(child: content(isCircleShape: true, width: 45.0, height: 35.0))
      ],
    );
  }

  Widget middleContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        content(isCircleShape: true),
        const Spacer(),
        content(isCircleShape: true),
        const Spacer()
      ],
    );
  }

  Widget graphContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [Expanded(child: content(height: 200.0))],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(children: [
          const SizedBox(
            width: 10.0,
          ),
          Expanded(child: content()),
          const SizedBox(width: 10.0)
        ])
      ],
    );
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
