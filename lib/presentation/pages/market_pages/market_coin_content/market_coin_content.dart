import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class MarketCoinContent extends StatefulWidget {
  const MarketCoinContent({super.key});

  @override
  State<MarketCoinContent> createState() => _MarketCoinContentState();
}

class _MarketCoinContentState extends State<MarketCoinContent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offsetTween;
  late Animation<double> radiusTween;
  late Animation<Color?> colorTween;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    offsetTween = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(-139.0, 0.0))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
    radiusTween = Tween<double>(begin: 12.0, end: 0.0).animate(controller);
    colorTween = ColorTween(
            begin: Colors.transparent, end: AppColorsUtility.internalShadow)
        .animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 76.0,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                    color: AppColorsUtility.internalShadow,
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 3.0)
              ]),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(alignment: Alignment.center, children: [
  //     Align(
  //         alignment: Alignment.centerRight,
  //         child: Padding(
  //           padding: const EdgeInsets.only(right: 16.0),
  //           child: Container(
  //             width: 139.0,
  //             height: 76.0,
  //             decoration: BoxDecoration(
  //                 color: AppColorsUtility.orange,
  //                 boxShadow: [
  //                   BoxShadow(
  //                       color: colorTween.value!,
  //                       offset: const Offset(0.0, 3.0),
  //                       blurRadius: 3.0)
  //                 ],
  //                 borderRadius: const BorderRadius.only(
  //                   topRight: Radius.circular(12.0),
  //                   bottomRight: Radius.circular(12.0),
  //                 )),
  //           ),
  //         )),
  //     AnimatedBuilder(
  //         animation: controller,
  //         builder: (BuildContext context, Widget? child) {
  //           double radius = radiusTween.value * (1.0 - controller.value);
  //           return Transform.translate(
  //               offset: offsetTween.value * controller.value,
  //               child: GestureDetector(
  //                   onHorizontalDragUpdate: (details) {
  //                     double width = MediaQuery.of(context).size.width;
  //                     controller.value -= details.primaryDelta! / width;
  //                   },
  //                   onHorizontalDragEnd: (details) {
  //                     if (details.primaryVelocity! >= 150.0) {
  //                       controller.animateTo(0.0);
  //                     } else if (details.primaryVelocity! <= 150.0 ||
  //                         controller.value >= 0.2) {
  //                       controller.animateTo(1.0);
  //                     } else {
  //                       controller.animateTo(0.0);
  //                     }
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //                     child: Container(
  //                       height: 76.0,
  //                       width: MediaQuery.of(context).size.width - 32,
  //                       decoration: BoxDecoration(
  //                           color: Theme.of(context).colorScheme.surface,
  //                           borderRadius: BorderRadius.only(
  //                               topLeft: const Radius.circular(12.0),
  //                               bottomLeft: const Radius.circular(12.0),
  //                               topRight: Radius.circular(radius),
  //                               bottomRight: Radius.circular(radius)),
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: AppColorsUtility.internalShadow,
  //                                 blurRadius: 3.0,
  //                                 offset: const Offset(0.0, 3.0))
  //                           ]),
  //                     ),
  //                   )));
  //         },
  //         child: null),
  //   ]);
  // }
}
