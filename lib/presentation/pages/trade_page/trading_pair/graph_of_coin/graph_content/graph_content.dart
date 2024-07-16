import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/bloc/trade_graph/bloc/trade_graph_bloc.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/graph_custom_paint.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/graph_of_coin/graph_content/graph_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class GraphContentMain extends StatefulWidget {
  final int index;
  const GraphContentMain(this.index, {super.key});

  @override
  State<GraphContentMain> createState() => _GraphContentMainState();
}

class _GraphContentMainState extends State<GraphContentMain> {
  GraphViewModel model = GraphViewModel();
  Map<int, Widget> slidingItems = {};

  @override
  void initState() {
    // context
    //     .read<TradeGraphBloc>()
    //     .add(GetDetailInfoCoinTradeGraphEvent(model.getCoinWithLowerCase()));
    model.setIndex(widget.index);
    slidingItems = makeSlidingItems(model.getCurrentIndex());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32.0,
          width: MediaQuery.of(context).size.width - 32.0,
          child: CupertinoSlidingSegmentedControl(
              thumbColor: Theme.of(context).colorScheme.surface,
              children: makeSlidingItems(model.getCurrentIndex()),
              groupValue: model.getCurrentIndex(),
              onValueChanged: (index) {
                model.setIndex(index as int);
              }),
        ),
        SizedBox(
          height: 54.0,
          width: MediaQuery.of(context).size.width,
          child: makeIconMoneyPercentTop(),
        ),
        SizedBox(
          height: 38.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: generateGraphSettingsButtons(),
          ),
        )
      ],
    );
  }

  Map<int, Widget> makeSlidingItems(int index) {
    TextStyle? textStyle;
    Map<int, Widget> dataWidgets = {};
    for (int i = 0; i < model.getTitlesOfDates().length; i++) {
      if (i == index) {
        textStyle = Theme.of(context).textTheme.bodySmall;
        dataWidgets[i] = Text(
          model.getTitlesOfDates()[i],
          style: textStyle,
        );
      } else {
        textStyle = TextStyle(
            color: AppColorsUtility.secondary,
            fontSize: 14.0,
            fontWeight: FontWeight.w400);
        dataWidgets[i] = Text(model.getTitlesOfDates()[i], style: textStyle);
      }
    }
    return dataWidgets;
  }

  // Widget makeCoinButtons() {
  //   List<Widget> buttons = [];

  //   for (int i = 0; i <= model.getTitles().length; i++) {
  //     Widget title = Text(model.getCoinTitles()[i],
  //         style: TextStyle(
  //             color: i == model.getCoinTitleOfButtonIndex()
  //                 ? AppColorsUtility.surface
  //                 : AppColorsUtility.secondary,
  //             fontSize: 14.0,
  //             fontWeight: FontWeight.w400));
  //     if (i == model.getCoinTitleOfButtonIndex()) {
  //       Color background = UserServiceHive.getIsDarkTheme()
  //           ? AppColorsUtility.darkPrimary
  //           : AppColorsUtility.onboardingPrimary;
  //       buttons.add(GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             model.setIndexOfButtonIndexCoin(i);
  //           });
  //         },
  //         child: Container(
  //           width: 80.0,
  //           height: 28.0,
  //           decoration: BoxDecoration(
  //               color: background,
  //               borderRadius: const BorderRadius.all(Radius.circular(8.0)),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: AppColorsUtility.internalShadow,
  //                     offset: const Offset(0.0, 3.0),
  //                     blurRadius: 3.0)
  //               ]),
  //           child: Center(child: title),
  //         ),
  //       ));
  //     } else {
  //       buttons.add(GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             model.setIndexOfButtonIndexCoin(i);
  //           });
  //         },
  //         child: Container(
  //           width: 80.0,
  //           height: 28.0,
  //           decoration: BoxDecoration(
  //               color: Theme.of(context).colorScheme.surface,
  //               borderRadius: const BorderRadius.all(Radius.circular(8.0)),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: AppColorsUtility.internalShadow,
  //                     offset: const Offset(0.0, 2.0),
  //                     blurRadius: 3.0)
  //               ]),
  //           child: Center(child: title),
  //         ),
  //       ));
  //     }
  //   }
  //   return SizedBox(
  //     height: 32.0,
  //     width: sizeOfScreen().width,
  //     child: ListView.separated(
  //       padding: const EdgeInsets.only(bottom: 5.0),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: buttons.length,
  //       itemBuilder: (context, index) {
  //         return buttons[index];
  //       },
  //       separatorBuilder: (context, index) {
  //         return const SizedBox(
  //           width: 8.0,
  //           height: 1,
  //         );
  //       },
  //     ),
  //   );
  // }

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
