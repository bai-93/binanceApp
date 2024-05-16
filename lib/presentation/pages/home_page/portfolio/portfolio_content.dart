import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';
import 'package:sheker/utilities/regex_pattern.dart';
import '../../../../domain/models/responses/crypto_models/list_crypto_currencies_model.dart';

class PortfolioCellContent extends StatelessWidget {
  CryptoModel? data;
  PortfolioCellContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Theme.of(context).colorScheme.background,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      elevation: 3.0,
      shadowColor: Colors.blue,
      child: SizedBox(
        height: 76.0,
        width: MediaQuery.of(context).size.width,
        child: makeCoinCell(context),
      ),
    );
  }

  Widget makeCoinCell(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        makeCoinImage(),
        const SizedBox(width: 8.0),
        makeSymbolTitlesColumn(context),
        const Spacer(),
        makePriceTitlesColumn(context)
      ],
    );
  }

  Widget makeCoinImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 14.0, bottom: 14.0),
      child: Image.asset(
        'lib/images/coin/${data?.symbol}.png',
        height: 40.0,
        width: 40.0,
      ),
    );
  }

  Widget makeSymbolTitlesColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          makeCoinTitles(data?.name ?? "", context),
          const SizedBox(
            height: 4.0,
          ),
          makeCoinTitles(data?.symbol ?? "", isTitle: false, context)
        ],
      ),
    );
  }

  Widget makeCoinTitles(String data, BuildContext context,
      {bool isTitle = true}) {
    return Text(
      data,
      style: isTitle
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.titleSmall,
    );
  }

  Widget makePriceTitlesColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8.0, top: 15.0, bottom: 15.0, right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          makePriceTitleText(context),
          const SizedBox(
            height: 4.0,
          ),
          makePercentTitleText()
        ],
      ),
    );
  }

  Widget makePriceTitleText(BuildContext context) {
    String text = data?.priceUsd ?? "";
    double price = double.parse(text);
    String textData = "\$${MoneyFormatterUtility.moneyFormatShort(price)}";
    return Text(
      textData,
      style: Theme.of(context).textTheme.labelMedium,
      softWrap: true,
    );
  }

  Widget makePercentTitleText() {
    double percent = double.parse(data?.changePercent24Hr ?? "");
    String percent24h = MoneyFormatterUtility.moneyFormatShort(percent);
    Color color = percent > 0 ? Colors.green : Colors.red;
    String signValue = percent > 0 ? "+" : "";

    return Text(
      "$signValue$percent24h" "%",
      softWrap: true,
      style: TextStyle(color: color, fontSize: 14.0),
    );
  }
}
