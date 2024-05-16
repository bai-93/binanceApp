import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/pages/home_page/market_movers/market_movers_graph.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';
import '../../../../utilities/shimmer_utility.dart';

class MarketMoversContent extends StatefulWidget {
  CryptoModel model;
  MarketMoversContent(this.model, {super.key});

  @override
  State<MarketMoversContent> createState() => _MarketMoversContentState();
}

class _MarketMoversContentState extends State<MarketMoversContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4.0,
        ),
        PhysicalModel(
          elevation: 2.0,
          color: Theme.of(context).colorScheme.background,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(12.0),
          child: makeContainer(),
        ),
        const SizedBox(
          height: 4.0,
        )
      ],
    );
  }

  Widget makeContainer() {
    return SizedBox(
      width: 156.0,
      height: 172.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.5, right: 12.5, top: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeNameCryptoText(),
                    makePriceText(),
                    makePercentText()
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: Image.asset(
                            'lib/images/coin/${widget.model.symbol}.png'))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          BlocProvider<DetailInfoGraphBloc>(
            create: (context) {
              return DetailInfoGraphBloc();
            },
            child: MarketMoversGraph(widget.model),
          ),
          const SizedBox(
            height: 4.0,
          ),
          make24hrVolume()
        ],
      ),
    );
  }

  Widget makeNameCryptoText() {
    String text = widget.model.symbol ?? '';
    String data = "$text/USD";
    return Text(
      data,
      maxLines: 1,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget makePriceText() {
    String data = widget.model.priceUsd ?? '0.0';
    double price = double.parse(data);
    return Text(
      MoneyFormatterUtility.moneyFormatShort(price),
      maxLines: 1,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget make24hrVolume() {
    String data =
        MoneyFormatterUtility.moneyFormatOneComma(widget.model.volumeUsd24Hr);
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '24H Vol.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget makePercentText() {
    String text = widget.model.changePercent24Hr ?? '0.0';
    double data = double.parse(text);
    return Text(
      "${MoneyFormatterUtility.moneyFormatShort(data)}%",
      maxLines: 1,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: data >= 0 ? AppColorsUtility.green : Colors.red,
          fontSize: 14.0,
          fontWeight: FontWeight.w400),
    );
  }

  Widget shimmerGraph() {
    return makeShimmerUtility(
        Container(
          color: Colors.white,
          width: 85.0,
          height: 36.0,
        ),
        context);
  }
}
