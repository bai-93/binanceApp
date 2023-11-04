import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';

class CryptoDescription extends StatelessWidget {
  final CryptoDetailModel? object;
  const CryptoDescription(this.object, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 50.0,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: textTitle('Подробно ${object?.data.name}',
              fontSize: 25, fontWeight: FontWeight.w500)),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Ранг', value: '${object?.data.rank}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Доступное предложение для торговли',
          value: '${object?.data.supply}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Количество выпущенных активов',
          value: '${object?.data.maxSupply}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Предложение х цена',
          value: '${object?.data.marketCapUsd}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Торги за 24 часа',
          value: '${object?.data.volumeUsd24Hr}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Взвешенная по объему цена',
          value: '${object?.data.priceUsd}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Последние изменения 24 часа',
          value: '${object?.data.changePercent24Hr}'),
      const SizedBox(
        height: 15.0,
      ),
      listDescription(context, 'Средняя цена за последние 24 часа',
          value: '${object?.data.vwap24Hr}'),
      const SizedBox(height: 40.0)
    ]);
  }

  Widget listDescription(BuildContext context, String description,
      {String value = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: textTitle(description)),
        const SizedBox(
          width: 30.0,
        ),
        Flexible(flex: 1, child: textTitle(value))
      ],
    );
  }

  Widget textTitle(String title,
      {Color color = Colors.black,
      double fontSize = 20.0,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      title,
      softWrap: true,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
