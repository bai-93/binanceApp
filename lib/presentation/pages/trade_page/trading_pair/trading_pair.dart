import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/coins_model.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/trading_websocket_model.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';

class TradingPair extends StatefulWidget {
  const TradingPair({super.key});

  @override
  State<TradingPair> createState() => _TradingPairState();
}

class _TradingPairState extends State<TradingPair> {
  final TradingWebSocketModel _webSocketModel = TradingWebSocketModel();
  MenuController controller = MenuController();
  bool flag = true;
  final CoinModel _coinModel = CoinModel();
  String coinUsd = "123";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      await _webSocketModel.isReady().then((val) {
        if (val) {
          debugPrint("Connection is successfull");
          _webSocketModel.subscribeToCoin([_coinModel.getCurrentSocketCoin()]);
          _webSocketModel.getSocketStream(
            (data) {
              String formatedValue =
                  MoneyFormatterUtility.dollarFormat(data?.price);
              setState(() {
                coinUsd = formatedValue;
              });
            },
            () {
              debugPrint("failure ");
            },
          );
        } else {
          debugPrint("Websocket connection is failed");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              makeDropdown(),
              const SizedBox(height: 4.0),
              Text(
                coinUsd,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColorsUtility.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Text(
            '<= web socket data',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              debugPrint("graph button was tapped");
            },
            child: Image.asset(
              'lib/images/trade/graph.png',
              width: 24.0,
              height: 24.0,
            ),
          )
        ],
      ),
    );
  }

  Widget makeDropdown() {
    String coinToUsd = _coinModel.getCurrentTitleCoinUSD();
    Icon arrowIcon = Icon(
        flag ? Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded);
    return MenuAnchor(
      menuChildren:
          _coinModel.getAllTitlesCoinUSD().map<Widget>((String value) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _coinModel
                  .setIndex(_coinModel.getAllTitlesCoinUSD().indexOf(value));
              controller.close();
            });
            _webSocketModel
                .subscribeToCoin([_coinModel.getCurrentSocketCoin()]);
          },
          child: SizedBox(
            height: 35.0,
            width: 100,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        );
      }).toList(),
      controller: controller,
      onOpen: () {
        setState(() {
          flag = !flag;
        });
      },
      onClose: () {
        setState(() {
          flag = !flag;
        });
      },
      alignmentOffset: const Offset(-9.0, 0.0),
      style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).scaffoldBackgroundColor)),
      child: GestureDetector(
        onTap: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 93.0,
                height: 18.0,
                child: Text(
                  coinToUsd,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.labelMedium,
                )),
            arrowIcon
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _webSocketModel.closeConnection();
    super.dispose();
  }
}
