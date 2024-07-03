import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class MarketDataShimmer extends StatelessWidget {
  const MarketDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hintColor,
      highlightColor: Theme.of(context).primaryColor,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8.0);
          },
          itemBuilder: (context, index) {
            return Container(
              height: 76.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColorsUtility.internalShadow,
                        blurRadius: 3.0,
                        offset: const Offset(0.0, 3.0))
                  ]),
            );
          }),
    );
  }
}
