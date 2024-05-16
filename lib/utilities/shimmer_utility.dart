import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget makeShimmerUtility(Widget child, BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Theme.of(context).hintColor,
    highlightColor: Theme.of(context).primaryColor,
    child: child,
  );
}
