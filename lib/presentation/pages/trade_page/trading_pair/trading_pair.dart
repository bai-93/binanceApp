import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/coins_model.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/trading_websocket_model.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';

class TradingPair extends StatefulWidget {
  void Function(String formatedValue, String rawValue) getPriceValue;
  TradingPair(this.getPriceValue, {super.key});

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
              widget.getPriceValue(formatedValue, data?.price ?? "0.0");
              setState(() {
                coinUsd = formatedValue;
              });
            },
            () {
              widget.getPriceValue('', '');
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
              context.go('/trade/graph', extra: _coinModel.getCurrentIndex());
              debugPrint('current index == ${_coinModel.getCurrentIndex()}');
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
              color: Theme.of(context).colorScheme.surface,
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
        backgroundColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
      ),
      child: GestureDetector(
        onTap: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open(position: const Offset(0.0, 40.0));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 100.0,
                height: 28.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          color: AppColorsUtility.internalShadow,
                          offset: const Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(7.0))),
                child: Center(
                  child: Text(
                    coinToUsd,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
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
