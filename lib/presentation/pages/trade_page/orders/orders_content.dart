import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/date_format.dart';
import 'package:sheker/utilities/money_formatter.dart';

class OrderContent extends StatelessWidget {
  final bool isHide;
  final List<String> cointTitles;
  final List<String> price;
  final List<String> amount;

  const OrderContent(this.isHide, this.cointTitles, this.price, this.amount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return isHide ? makeImageView(context) : makeContent(context);
  }

  Widget makeContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 135.0 * (cointTitles.length),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: cointTitles.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              double totalSumm =
                  double.parse(price[index]) * double.parse(amount[index]);
              String valueSumm =
                  MoneyFormatterUtility.moneyFormatShort(totalSumm);
              return Column(children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          makeText(cointTitles[index], context, isMedium: true),
                          makeText(
                              DateFormatUtility.getCurrentFormat(), context,
                              isDate: true)
                        ],
                      ),
                      const SizedBox(height: 9.0),
                      Row(
                        children: [
                          makeText('Sell', context, isRed: true),
                          const SizedBox(
                            width: 5.0,
                          ),
                          makeText('Limit', context, isMedium: true),
                          const Spacer(),
                          makeCancelButton(context)
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          makeText('Price', context),
                          const Spacer(),
                          makeText(price[index], context, isSmall: true),
                          const Spacer(),
                          makeText('Filled', context),
                          const Spacer(),
                          makeText('0.00%', context, isSmall: true)
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          makeText('Amount', context),
                          const Spacer(),
                          makeText(amount[index], context),
                          const Spacer(),
                          makeText('Total', context),
                          const Spacer(),
                          Expanded(child: makeText('$valueSumm USDT', context)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                  color: AppColorsUtility.otline,
                )
              ]);
            },
          ),
        ),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }

  Widget makeCancelButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Cancel button');
      },
      child: Container(
        height: 28.0,
        width: 80.0,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(7.0)),
            boxShadow: [
              BoxShadow(
                  color: AppColorsUtility.internalShadow,
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 3.0))
            ]),
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(
                color: AppColorsUtility.secondary,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget makeText(String input, BuildContext context,
      {bool isMedium = false,
      bool isSmall = false,
      bool isDate = false,
      bool isRed = false}) {
    TextStyle? style = const TextStyle();
    ThemeData theme = Theme.of(context);
    if (isMedium) {
      style = theme.textTheme.labelMedium;
    } else if (isSmall) {
      style = theme.textTheme.bodySmall;
    } else if (isDate) {
      style = TextStyle(
          color: AppColorsUtility.secondary,
          fontSize: 14.0,
          fontWeight: FontWeight.w400);
    } else if (isRed) {
      style = TextStyle(
          color: AppColorsUtility.red,
          fontSize: 16.0,
          fontWeight: FontWeight.w400);
    } else {
      style = TextStyle(
          color: AppColorsUtility.secondary,
          fontSize: 14.0,
          fontWeight: FontWeight.w400);
    }
    return Text(
      input,
      softWrap: true,
      style: style,
    );
  }

  Widget makeImageView(BuildContext context) {
    return SizedBox(
        height: 192.0,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Image.asset('lib/images/trade/group.png',
                width: 45.0, height: 45.0)));
  }
}
