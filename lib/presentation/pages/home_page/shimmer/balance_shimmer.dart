import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BalanceShimmer extends StatelessWidget {
  const BalanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hintColor,
      highlightColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Center(
              child: Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width - 40.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          )),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              height: 128.0,
              width: MediaQuery.of(context).size.width - 40.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))))
        ],
      ),
    );
  }
}
