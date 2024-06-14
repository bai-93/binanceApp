import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/trade_page/trading_settings_limit_price/price_amount_viewmodel.dart';
import 'package:sheker/utilities/app_colors.dart';

import 'buy_btc.dart';

class PriceAmountList extends StatefulWidget {
  StreamController<String> priceController =
      StreamController<String>.broadcast();
  PriceAmountList({super.key});

  @override
  State<PriceAmountList> createState() => _PriceAmountListState();
}

class _PriceAmountListState extends State<PriceAmountList> {
  PriceAmountViewModel model = PriceAmountViewModel();
  @override
  void initState() {
    widget.priceController.stream.listen((price) {
      model.addData(price);
    }, onError: (error) {
      debugPrint("ERROROR stream");
    });

    model.readyCallback = () {
      setState(() {});
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    widget.priceController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    makeText('Price'),
                    const SizedBox(
                      height: 5.0,
                    ),
                    makeListView(model.redPrice, isRedPrice: true),
                    makeListView(model.greenPrice, isGreenPrice: true)
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                makeText('Amount'),
                const SizedBox(
                  height: 5.0,
                ),
                makeListView(model.redAmount, isLeft: false, isRedAmount: true),
                makeListView(model.greenAmount, isGreenAmount: true)
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            const BuyBtcPriceLimit(),
          ],
        ),
        const SizedBox(
          height: 30.0,
        )
      ],
    );
  }

  Widget makeText(String data) {
    return Text(data, style: Theme.of(context).textTheme.titleSmall);
  }

  Widget makeListView(List<String> dataSources,
      {bool isLeft = true,
      bool isRedPrice = false,
      bool isRedAmount = false,
      bool isGreenPrice = false,
      bool isGreenAmount = false}) {
    return SizedBox(
      height: 180,
      width: isRedAmount || isGreenAmount ? 70.0 : 80.0,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataSources.length,
          itemBuilder: (context, index) {
            if (isRedPrice) {
              return Text(
                dataSources[index],
                textAlign: isLeft ? TextAlign.left : TextAlign.right,
                style: makeTextStyle(flag: isRedPrice),
              );
            }
            if (isRedAmount) {
              return makeRichText(dataSources[index], flag: true);
            }
            if (isGreenPrice) {
              return Text(dataSources[index],
                  textAlign: isLeft ? TextAlign.left : TextAlign.right,
                  style: makeTextStyle());
            }
            if (isGreenAmount) {
              return makeRichText(dataSources[index]);
            }
          }),
    );
  }

  TextStyle makeTextStyle({bool flag = false}) {
    return TextStyle(
        color: flag ? AppColorsUtility.red : AppColorsUtility.green,
        fontWeight: FontWeight.w400,
        fontSize: 12.0);
  }

  Widget makeRichText(String input, {bool flag = false}) {
    List<String> partOfText = model.getRandomPartOfString(input);
    double fontSize = 12.0;
    FontWeight fontWeight = FontWeight.w400;
    Color? colorFont = Theme.of(context).textTheme.labelSmall?.color;
    Color? backgroundColor = flag
        ? AppColorsUtility.red.withOpacity(0.45)
        : AppColorsUtility.green.withOpacity(0.45);

    return RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
            text: partOfText[0],
            style: TextStyle(
                color: colorFont,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: 1.39),
            children: [
              TextSpan(
                  text: partOfText[1],
                  style: TextStyle(
                      color: colorFont,
                      backgroundColor: backgroundColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      height: 1.39))
            ]));
  }
}
