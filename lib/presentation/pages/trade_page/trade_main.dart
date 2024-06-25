import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:sheker/config/base_widgets/base_statefull.dart";
import "package:sheker/config/base_widgets/base_stateless.dart";
import "package:sheker/presentation/pages/trade_page/orders/orders_main.dart";
import "package:sheker/presentation/pages/trade_page/trading_pair/trading_pair.dart";
import "package:sheker/presentation/pages/trade_page/trading_settings_limit_price/price_amount.dart";
import "package:sheker/presentation/pages/trade_page/trading_settings_limit_price/trading_limit_price.dart";
import "package:sheker/utilities/app_colors.dart";

class TradeMain extends BaseScreen {
  const TradeMain({super.key});

  @override
  State<TradeMain> createState() => _TradeMainState();
}

class _TradeMainState extends BaseScreenState<TradeMain> with BaseScreenMixin {
  PriceAmountList _priceAmountList = PriceAmountList();
  Map<int, Widget> slidingItems = {};
  int slidingIndex = 0;
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      title: Text(
        'Trade',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        IconButton(
            onPressed: () {
              debugPrint("trade AppBar");
            },
            icon: Image.asset('lib/images/trade/order.png'))
      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  Map<int, Widget> makeSlidingItems(int index) {
    List<String> textsData = ['Spot', 'Margin', 'Grid', 'Fiat'];
    TextStyle? textStyle;
    Map<int, Widget> dataWidgets = {};
    for (int i = 0; i < 4; i++) {
      if (i == index) {
        textStyle = Theme.of(context).textTheme.bodySmall;
        dataWidgets[i] = Text(
          textsData[i],
          style: textStyle,
        );
      } else {
        textStyle = TextStyle(
            color: AppColorsUtility.secondary,
            fontSize: 14.0,
            fontWeight: FontWeight.w400);
        dataWidgets[i] = Text(textsData[i], style: textStyle);
      }
    }
    return dataWidgets;
  }

  @override
  Widget body() {
    slidingItems = makeSlidingItems(slidingIndex);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: Column(
        children: [
          SizedBox(
            width: sizeOfScreen().width,
            height: 60.0,
            child: CupertinoSlidingSegmentedControl(
                thumbColor: Theme.of(context).colorScheme.surface,
                groupValue: slidingIndex,
                children: slidingItems,
                onValueChanged: (item) {
                  setState(() {
                    slidingIndex = item ?? 0;
                  });
                }),
          ),
          TradingPair((formatedValue, rawValue) {
            _priceAmountList.priceController.add(rawValue);
          }),
          const TradingLimitPriceAmount(),
          _priceAmountList,
          const OrdersMain()
        ],
      ),
    );
  }
}
