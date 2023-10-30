import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageCryptoShimmer extends StatelessWidget {
  const HomePageCryptoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        color: Colors.transparent,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    content(isCircleShape: true, width: 35.0, height: 35.0),
                    const Spacer(),
                    content(isCircleShape: true, width: 25.0, height: 25.0),
                    const SizedBox(
                      width: 10.0,
                    ),
                    content(isCircleShape: true, width: 25.0, height: 25.0),
                    const SizedBox(
                      width: 10.0,
                    ),
                    content(isCircleShape: true, width: 25.0, height: 25.0),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2, child: content(height: 80.0, radius: 40.0)),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        flex: 0,
                        child: content(
                            height: 80.0, width: 80.0, isCircleShape: true))
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2, child: content(height: 50.0, radius: 40.0)),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        flex: 2, child: content(height: 50.0, radius: 40.0))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                content(
                    radius: 20.0,
                    width: MediaQuery.of(context).size.width - 20.0,
                    height: 130.0),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: content(height: 30.0, radius: 20.0)),
                    content(height: 30.0, radius: 20.0),
                    content(height: 30.0, radius: 20.0),
                    const Spacer(),
                    const SizedBox(
                      width: 10.0,
                    )
                  ],
                ),
                listContent(context),
                listContent(context),
                listContent(context)
              ],
            ),
          ),
        ),
      ),
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

  Widget listContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          content(isCircleShape: true, width: 30.0, height: 30.0),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              content(height: 40.0, width: size.width * 1 / 3, radius: 20.0),
              const SizedBox(
                height: 5.0,
              ),
              content(height: 25.0, width: size.width * 1 / 3, radius: 20.0)
            ],
          ),
          const Spacer(),
          Column(
            children: [
              content(height: 40.0, width: size.width * 1 / 3, radius: 20.0),
              const SizedBox(
                height: 5.0,
              ),
              content(height: 25.0, width: size.width * 1 / 3, radius: 20.0)
            ],
          ),
        ],
      ),
    );
  }
}
