import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/bloc/trade_graph/bloc/trade_graph_bloc.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/graph_custom_paint.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/graph_of_coin/graph_content/graph_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class GraphContentMain extends StatefulWidget {
  final void Function() getNewCoinInfoCallback;
  final int index;
  const GraphContentMain(this.index, this.getNewCoinInfoCallback, {super.key});

  @override
  State<GraphContentMain> createState() => _GraphContentMainState();
}

class _GraphContentMainState extends State<GraphContentMain> {
  GraphViewModel model = GraphViewModel();

  @override
  void initState() {
    context
        .read<TradeGraphBloc>()
        .add(GetDetailInfoCoinTradeGraphEvent(model.getCoinWithLowerCase()));
    model.setIndex(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model.setIndex(widget.index);
    return Container(
      height: 301.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
                color: AppColorsUtility.internalShadow,
                blurRadius: 3.0,
                offset: const Offset(0.0, 3.0)),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          SizedBox(
            height: 54.0,
            width: MediaQuery.of(context).size.width,
            child: makeIconMoneyPercentTop(),
          ),
          makeGraph(),
          SizedBox(
            height: 38.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: generateGraphSettingsButtons(),
            ),
          )
        ],
      ),
    );
  }

  Widget makeIconMoneyPercentTop() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, top: 14.0),
          child: Image.asset(model.getImage()),
        ),
        const SizedBox(width: 8.0),
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.getCoinFullName(),
                  style: Theme.of(context).textTheme.labelMedium),
              Text(model.getCoinSymbolName(),
                  style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 13.0, right: 14),
          child: Column(
            children: [
              Text(model.getCurrentPrice(),
                  style: Theme.of(context).textTheme.labelMedium),
              Text(
                model.getCurrentPercent(),
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: model.getPositiveOrNegativeColor()),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget makeGraph() {
    return BlocListener<TradeGraphBloc, TradeGraphState>(
      listener: (context, state) {
        if (state is SuccessLoadedDetailInfoCoinGraphTradeState) {
          debugPrint('here listener success detail info graph trade state');
          print(state.model);
          // context
          //     .read<TradeGraphBloc>()
          //     .add(const GetIntervalInfoCoinTradeGraphEvent('h1', 'bitcoin'));
        }
      },
      child: BlocBuilder<TradeGraphBloc, TradeGraphState>(
        builder: (context, state) {
          if (state is GraphDataLoadingGraphTradeState ||
              state is SuccessLoadedDetailInfoCoinGraphTradeState) {
            return SizedBox(
                height: 201.0, width: MediaQuery.of(context).size.width);
          }
          if (state is SuccessLoadedIntervalHistoryGraphTradeState) {
            return GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  model.setPoints(details.globalPosition);
                });
              },
              child: SizedBox(
                  height: 201.0,
                  width: MediaQuery.of(context).size.width,
                  child: RepaintBoundary(
                    child: CustomPaint(
                        painter: GraphCustomPaint(
                      state.model,
                      (priceCoin, date) {},
                    )),
                  )),
            );
          }
          return Container(color: Colors.red, width: 100.0, height: 100.0);
        },
      ),
    );
  }

  List<Widget> generateGraphSettingsButtons() {
    List<Widget> items = [];
    for (int i = 0; i < model.getGraphSettingsNames().length; i++) {
      items.add(GestureDetector(
        onTap: () {
          debugPrint(model.getGraphSettingsNames()[i]);
        },
        child: SizedBox(
          height: 24.0,
          width: 24.0,
          child: Image.asset(model.getGraphSettingsImages()[i]),
        ),
      ));
    }
    return items;
  }
}
