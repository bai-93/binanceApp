import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
import 'package:sheker/presentation/bloc/market/market_graph_bloc/bloc/market_graph_bloc.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_draggable_page/wallet_draggable_content/wallet_assets_filtered_data.dart';
import 'package:sheker/uicomponent/small_graphic.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/shimmer_utility.dart';

class WalletAssetsContent extends StatefulWidget {
  const WalletAssetsContent({super.key});

  @override
  State<WalletAssetsContent> createState() => _WalletAssetsContentState();
}

class _WalletAssetsContentState extends State<WalletAssetsContent> {
  WalletAssetsFilteredModel model = WalletAssetsFilteredModel();

  @override
  void initState() {
    context.read<CryptoListBloc>().add(CryptoListLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CryptoListBloc, CryptoListState>(
      listener: (BuildContext context, CryptoListState state) {
        if (state is CryptoListLoaded) {
          model.passData(state.modelList);
        }
      },
      child: BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return Column(
              children: [makeContent(), const SizedBox(height: 50.0)],
            );
          }
          return makeShimmer();
        },
      ),
    );
  }

  Widget makeShimmer() {
    return ListView.separated(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1.0,
              color: AppColorsUtility.otline),
        );
      },
      itemBuilder: (context, index) {
        return makeShimmerUtility(
            Padding(
              padding: const EdgeInsets.only(left: 15.5, right: 15.0),
              child: Container(
                height: 68.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
            context);
      },
    );
  }

  Widget makeContent() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.filteredCoins.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.5, right: 15.5),
          child: SizedBox(
            height: 71.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Image.asset(model.getImagePath(index),
                      width: 40.0, height: 40.0),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      makeTextSymbol(model.filteredCoins[index].symbol ?? ''),
                      const SizedBox(height: 2.0),
                      makeTextPrice(
                          model.filteredCoins[index].priceUsd ?? '0.0',
                          model.filteredCoins[index].changePercent24Hr ?? '0.0')
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                BlocProvider(
                  create: (context) => MarketGraphBloc(),
                  child: WalletAssetsGraph(model.filteredCoins[index]),
                ),
                const Spacer(),
                makeTextPercent(
                    model.filteredCoins[index].changePercent24Hr ?? '0.0')
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1.0,
              color: AppColorsUtility.otline),
        );
      },
    );
  }

  Widget makeTextSymbol(String input) {
    return Text(input, style: Theme.of(context).textTheme.labelMedium);
  }

  Widget makeTextPrice(
    String input,
    String inputModel,
  ) {
    bool flag = model.isGreaterOrEqualToZero(inputModel);
    return Text(
      '\$${model.formateValues(input)}',
      style: TextStyle(
          fontSize: 14.0,
          color: flag ? AppColorsUtility.green : AppColorsUtility.red),
    );
  }

  Widget makeTextPercent(String input) {
    bool flag = model.isGreaterOrEqualToZero(input);
    String formatedValue = model.formateValues(input);
    String output = flag ? '+$formatedValue' : formatedValue;
    return Text(
      output,
      style: TextStyle(
          fontSize: 14.0,
          color: flag ? AppColorsUtility.green : AppColorsUtility.red),
    );
  }
}

class WalletAssetsGraph extends StatelessWidget {
  final CryptoModel model;
  const WalletAssetsGraph(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<MarketGraphBloc>()
        .add(MarketGraphCoinIntervalEvent(model.id ?? ''));
    return BlocBuilder<MarketGraphBloc, MarketGraphState>(
      builder: (context, state) {
        if (state is MarketGraphSuccessLoadedState) {
          return SizedBox(
              height: 36.0,
              width: 83.35,
              child: CustomPaint(
                painter: SmallGraphicComponent(state.model,
                    double.parse(model.changePercent24Hr ?? '0.0')),
              ));
        }
        return makeShimmer(context);
      },
    );
  }

  Widget makeShimmer(BuildContext context) {
    return makeShimmerUtility(
        Container(
          height: 36.0,
          width: 83.35,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
        ),
        context);
  }
}
