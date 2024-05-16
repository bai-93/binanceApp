import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/uicomponent/small_graphic.dart';
import 'package:sheker/utilities/shimmer_utility.dart';

class MarketMoversGraph extends StatefulWidget {
  CryptoModel model;
  MarketMoversGraph(this.model, {super.key});

  @override
  State<MarketMoversGraph> createState() => _MarketMoversGraphState();
}

class _MarketMoversGraphState extends State<MarketMoversGraph> {
  @override
  void initState() {
    super.initState();
    context
        .read<DetailInfoGraphBloc>()
        .add(GetIntervalInfoCryptoEvent('h1', widget.model.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailInfoGraphBloc, DetailInfoGraphState>(
        builder: (context, state) {
      if (state is GraphDataIsLoadingState) {
        return shimmerGraph();
      }
      if (state is SuccessLoadedDataDetailInfoCrypto) {
        return Container(
          height: 50.0,
          width: 50.0,
          color: Colors.red,
        );
      }
      if (state is SuccessGraphDataLoadedState) {
        return SizedBox(
          width: 85.0,
          height: 36.0,
          child: CustomPaint(
            painter: SmallGraphicComponent(state.model,
                double.parse(widget.model.changePercent24Hr ?? "0.0")),
          ),
        );
      }
      return const Center();
    });
  }

  Widget shimmerGraph() {
    return makeShimmerUtility(
        Container(
          width: 85.0,
          height: 36.0,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
        ),
        context);
  }
}
