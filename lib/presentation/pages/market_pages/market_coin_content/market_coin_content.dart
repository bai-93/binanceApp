import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/presentation/bloc/market/market_graph_bloc/bloc/market_graph_bloc.dart';
import 'package:sheker/uicomponent/small_graphic.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheker/utilities/money_formatter.dart';
import 'package:sheker/utilities/shimmer_utility.dart';

class MarketCoinContent extends StatefulWidget {
  CryptoModel cryptoModel;
  void Function() favoriteCallback;
  MarketCoinContent(this.favoriteCallback, this.cryptoModel, {super.key});

  @override
  State<MarketCoinContent> createState() => _MarketCoinContentState();
}

class _MarketCoinContentState extends State<MarketCoinContent>
    with SingleTickerProviderStateMixin {
  late SlidableController controller;

  @override
  void initState() {
    controller = SlidableController(this);
    context
        .read<MarketGraphBloc>()
        .add(MarketGraphCoinIntervalEvent(widget.cryptoModel.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return makeContent();
  }

  Widget makeContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Slidable(
          controller: controller,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dragDismissible: false,
            dismissible:
                Container(color: Colors.black, width: 50.0, height: 50.0),
            children: [
              GestureDetector(
                onTap: () {
                  widget.favoriteCallback();
                  controller.close();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColorsUtility.orange,
                      boxShadow: [
                        BoxShadow(
                            color: AppColorsUtility.internalShadow,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 3.0)
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      )),
                  height: 76.0,
                  width: 139.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/images/market/star_light.png',
                          width: 24.0, height: 24.0),
                      const SizedBox(height: 4.0),
                      Text('Add to Favorites',
                          style: TextStyle(
                              color: AppColorsUtility.surface,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              )
            ],
          ),
          child: makeDetailPage()),
    );
  }

  Widget makeDetailPage() {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 14.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    widget.cryptoModel.symbol ?? '',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '/USDT',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'vol ${MoneyFormatterUtility.moneyFormatCount(double.parse(widget.cryptoModel.supply!), count: 2)}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          // const Spacer(),
          Column(
            children: [
              const SizedBox(height: 8.0),
              Text(
                'Price ${MoneyFormatterUtility.dollarFormat(widget.cryptoModel.priceUsd)}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 2.0,
              ),
              makeGraphContainer()
            ],
          ),
          // const Spacer(),
          makePercentContainer(),
          const SizedBox(
            width: 14.0,
          )
        ],
      ),
    );
  }

  Widget makeGraphContainer() {
    return BlocBuilder<MarketGraphBloc, MarketGraphState>(
        builder: (context, state) {
      if (state is MarketGraphSuccessLoadedState) {
        double changePercent24Hr =
            double.parse(widget.cryptoModel.changePercent24Hr ?? '0.0');
        return SizedBox(
            height: 50.0,
            width: 93.0,
            child: CustomPaint(
              painter: SmallGraphicComponent(state.model, changePercent24Hr),
            ));
      }
      return makeShimmerUtility(
          Container(
            width: 93.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: AppColorsUtility.darkPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(12.0))),
          ),
          context);
      ;
    });
  }

  Widget makePercentContainer() {
    double changePercent24Hr =
        double.parse(widget.cryptoModel.changePercent24Hr ?? '0.0');
    Color backgroundColor = changePercent24Hr >= 0.0
        ? AppColorsUtility.green
        : AppColorsUtility.red;
    String positiveNegativePercent = changePercent24Hr >= 0.0 ? '+' : '';
    String formatedValue =
        MoneyFormatterUtility.moneyFormatCount(changePercent24Hr, count: 2);
    String outputText = '$positiveNegativePercent$formatedValue%';
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: backgroundColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 4.0, top: 2.0, bottom: 2.0, right: 4.0),
        child: Text(outputText,
            style: TextStyle(
                color: AppColorsUtility.surface,
                fontSize: 14.0,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
