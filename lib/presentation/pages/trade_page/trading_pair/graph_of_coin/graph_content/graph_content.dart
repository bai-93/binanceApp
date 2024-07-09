import 'package:flutter/material.dart';
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

  @override
  void initState() {
    model.setIndex(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 201.0, width: MediaQuery.of(context).size.width),
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
