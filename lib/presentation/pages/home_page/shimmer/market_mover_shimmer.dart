import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class MarketMoversShimmer extends StatelessWidget {
  const MarketMoversShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).hintColor,
        highlightColor: Theme.of(context).primaryColor,
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [makeTopTitles(context), makeTopTitles(context)],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 172.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return index == 4
                        ? const SizedBox(
                            width: 10.0,
                          )
                        : makeScrollContainer();
                  }),
            )
          ],
        ));
  }

  Widget makeScrollContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Container(
            width: 156,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
          ),
          const SizedBox(
            width: 4.0,
          )
        ],
      ),
    );
  }

  Container makeTopTitles(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      height: 18.0,
      width: MediaQuery.of(context).size.width * 0.4,
    );
  }
}
