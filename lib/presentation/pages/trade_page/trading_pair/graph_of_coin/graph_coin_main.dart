import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/graph_of_coin/graph_content/graph_content.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/graph_of_coin/view_model/graph_coin_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class GraphOfCoinMain extends BaseScreen {
  final int index;
  const GraphOfCoinMain(this.index, {super.key});
  @override
  State<GraphOfCoinMain> createState() => _GraphOfCoinMainState();
}

class _GraphOfCoinMainState extends BaseScreenState<GraphOfCoinMain>
    with BaseScreenMixin {
  late GraphCoinViewModel model;

  @override
  void initState() {
    model = GraphCoinViewModel();
    super.initState();
  }

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      title: Text('Trading', style: Theme.of(context).textTheme.bodyLarge),
      actions: [
        IconButton(
            onPressed: () {
              debugPrint('trading appbar');
            },
            icon: Image.asset('lib/images/trade/order.png'))
      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Stack(
        children: [
          SingleChildScrollView(child: body()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: sizeOfScreen().width,
              height: 115.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(
                      top: BorderSide(color: AppColorsUtility.internalShadow))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(child: makeBottomButton(() {
                    debugPrint("sell");
                  })),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                      child: makeBottomButton(() {
                    debugPrint("buy");
                  }, isBuy: false)),
                  const SizedBox(
                    width: 16.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GraphContentMain(widget.index),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Trading History',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          makePriceAmountTimeColumn(),
          const SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget makePriceAmountTimeColumn() {
    var data = model.generateNumber(69000, 10);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Price',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            Text(
              'Amount',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            makeText('Time', isDate: true),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: sizeOfScreen().width * 0.2,
              height: sizeOfScreen().height * 0.35,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return makeText(data[index].price,
                        flag: data[index].isGreen);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4.0,
                    );
                  },
                  itemCount: data.length),
            ),
            const Spacer(),
            SizedBox(
              width: sizeOfScreen().width * 0.2,
              height: sizeOfScreen().height * 0.35,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return makeColoredRichText(data[index].amount,
                        flag: data[index].isGreen);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4.0,
                    );
                  },
                  itemCount: data.length),
            ),
            const Spacer(),
            SizedBox(
              width: sizeOfScreen().width * 0.2,
              height: sizeOfScreen().height * 0.35,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return makeText(data[index].time, isDate: true);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4.0,
                    );
                  },
                  itemCount: data.length),
            )
          ],
        ),
      ],
    );
  }

  Widget makeText(String input, {bool flag = false, bool isDate = false}) {
    if (isDate) {
      return Text(
        input,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.right,
      );
    } else {
      return Text(
        input,
        style: TextStyle(
            color: flag ? AppColorsUtility.green : AppColorsUtility.red,
            fontSize: 12.0,
            fontWeight: FontWeight.w400),
      );
    }
  }

  Widget makeColoredRichText(String input, {bool flag = false}) {
    List<String> partOfText = model.getRandomPartOfString(input);
    double fontSize = 12.0;
    FontWeight fontWeight = FontWeight.w400;
    Color? colorFont = Theme.of(context).textTheme.labelSmall?.color;
    Color? backgroundColor = flag
        ? AppColorsUtility.green.withOpacity(0.45)
        : AppColorsUtility.red.withOpacity(0.45);
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: partOfText[0],
            style: TextStyle(
                color: colorFont,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: 1.39),
            children: [
              TextSpan(
                  text: partOfText[1],
                  style: TextStyle(
                      color: colorFont,
                      backgroundColor: backgroundColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      height: 1.39))
            ]));
  }

  Widget makeBottomButton(void Function() onTap, {bool isBuy = true}) {
    Image image = isBuy
        ? Image.asset('lib/images/trade/sell_blue.png',
            width: 24.0, height: 24.0)
        : Image.asset('lib/images/trade/sell_white.png',
            width: 24.0, height: 24.0);
    Text text = isBuy
        ? Text(
            'Sell',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        : Text(
            'Buy',
            style: TextStyle(
                color: AppColorsUtility.surface,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
            color: isBuy
                ? Theme.of(context).colorScheme.surface
                : AppColorsUtility.onboardingPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
                color: AppColorsUtility.onboardingPrimary, width: 2.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              const SizedBox(
                width: 4.0,
              ),
              text
            ],
          ),
        ),
      ),
    );
  }
}
