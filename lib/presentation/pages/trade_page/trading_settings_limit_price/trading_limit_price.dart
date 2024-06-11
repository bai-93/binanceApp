import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class TradingLimitPriceAmount extends StatefulWidget {
  const TradingLimitPriceAmount({super.key});

  @override
  State<TradingLimitPriceAmount> createState() =>
      _TradingLimitPriceAmountState();
}

class _TradingLimitPriceAmountState extends State<TradingLimitPriceAmount> {
  MenuController orderController = MenuController();
  bool orderFlag = false;
  String orderTitle = "10";
  List<String> orderData = ["10", "8", "6", "4", "2"];
  MenuController unitController = MenuController();
  bool unitFlag = false;
  String unitTitle = "0.00001";
  List<String> unitData = ["0.00001", "0.0001", "0.001", "0.01", "0.1"];
  int slidingIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  makeText('Order bk No.'),
                  const SizedBox(
                    height: 4.0,
                  ),
                  makeDropdown(orderController, orderFlag, (flag) {
                    setState(() {
                      orderFlag = flag;
                    });
                  }, (title) {
                    setState(() {
                      orderTitle = title;
                    });
                  }, orderTitle, orderData)
                ],
              ),
              Column(
                children: [
                  makeText('Unit'),
                  const SizedBox(
                    height: 4.0,
                  ),
                  makeDropdown(unitController, unitFlag, (flag) {
                    setState(() {
                      unitFlag = flag;
                    });
                  }, (value) {
                    unitTitle = value;
                  }, unitTitle, unitData, width: 80.0)
                ],
              ),
              const SizedBox(
                width: 11.0,
              ),
              SizedBox(
                height: 32.0,
                width: 164.0,
                child: CupertinoSlidingSegmentedControl(
                    groupValue: slidingIndex,
                    thumbColor: AppColorsUtility.onboardingPrimary,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    children: makeSlidingItems(),
                    onValueChanged: (index) {
                      setState(() {
                        slidingIndex = index ?? 0;
                      });
                    }),
              ),
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

  Map<int, Widget> makeSlidingItems() {
    Map<int, Widget> item = {};
    List<String> dataName = ["Buy", "Sell"];
    TextStyle? white = const TextStyle(
        color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400);
    TextStyle? grey = TextStyle(
        color: AppColorsUtility.secondary,
        fontSize: 14.0,
        fontWeight: FontWeight.w400);
    TextStyle? textStyle;
    for (int i = 0; i < 2; i++) {
      if (slidingIndex == i) {
        textStyle = white;
      } else {
        textStyle = grey;
      }
      item[i] = Text(dataName[i], style: textStyle);
    }
    return item;
  }

  Widget makeDropdown(
      MenuController controller,
      bool flagIcon,
      void Function(bool flag) closeOpen,
      void Function(String title) titleUpdate,
      String title,
      List<String> data,
      {bool flag = false,
      double height = 28.0,
      double width = 55.0}) {
    return Row(children: [
      MenuAnchor(
        menuChildren: data.map<Widget>((String value) {
          return GestureDetector(
            onTap: () {
              setState(() {
                titleUpdate(data[data.indexOf(value)]);
                closeOpen(false);
              });
              controller.close();
            },
            child: Container(
              height: height,
              width: width,
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                  child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              )),
            ),
          );
        }).toList(),
        style: MenuStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.surface)),
        controller: controller,
        onClose: () {
          closeOpen(false);
        },
        child: GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
              closeOpen(false);
            } else {
              controller.open(position: const Offset(0.0, 40.0));
              closeOpen(true);
            }
          },
          child: Container(
            padding: const EdgeInsets.only(left: 8.0, right: 2.0),
            height: 28.0,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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
