import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/utilities/money_formatter.dart';

class CryptoTopDescription extends StatelessWidget {
  final CryptoDetailModel? model;
  const CryptoTopDescription(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      textContent(
        '${model?.data.symbol}',
        Colors.grey.shade500,
        FontWeight.w500,
        28,
      ),
      const SizedBox(
        height: 10.0,
      ),
      textContent('${model?.data.name}', Colors.black, FontWeight.bold, 28),
      Row(children: [
        Expanded(
            child: textContent(
                MoneyFormatter.dollarFormat(model?.data.priceUsd),
                Colors.black,
                FontWeight.bold,
                23)),
        const SizedBox(
          width: 5.0,
        ),
        IconButton(
            onPressed: () {
              debugPrint("info button");
            },
            icon: Icon(
              Icons.info,
              color: Colors.grey.shade400,
            ))
      ])
    ]);
  }

  Widget textContent(
      String text, Color color, FontWeight fontWeight, double fontSize,
      {Alignment alignment = Alignment.topLeft}) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        softWrap: true,
        style:
            TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }
}
