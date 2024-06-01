import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class TradingLimitPriceAmount extends StatefulWidget {
  const TradingLimitPriceAmount({super.key});

  @override
  State<TradingLimitPriceAmount> createState() =>
      _TradingLimitPriceAmountState();
}

class _TradingLimitPriceAmountState extends State<TradingLimitPriceAmount> {
  MenuController orderController = MenuController();
  bool orderFlag = false;
  MenuController unitController = MenuController();
  bool unitFlag = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  makeText('Order bk No.'),
                  const SizedBox(
                    height: 4.0,
                  ),
                  makeDropdown(orderController, orderFlag)
                ],
              ),
              Column(
                children: [
                  makeText('Unit'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget makeText(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColorsUtility.secondary, fontSize: 12.0),
    );
  }

  Widget makeDropdown(MenuController controller, bool flagIcon,
      {bool flag = false}) {
    return Row(children: [
      MenuAnchor(
        menuChildren: const [
          SizedBox(
            height: 28.0,
            width: 55.0,
          )
        ],
        style: MenuStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.surface)),
        controller: controller,
        child: GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open(position: const Offset(0.0, 40.0));
            }
          },
          child: Container(
            height: 28.0,
            width: 55.0,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: AppColorsUtility.internalShadow,
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 4.0,
                      spreadRadius: 0.0)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(7.0))),
            child: Row(
              children: [
                const SizedBox(width: 5.0),
                Icon(flagIcon
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
