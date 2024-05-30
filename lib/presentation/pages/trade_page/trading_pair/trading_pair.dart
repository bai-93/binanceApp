import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/coins_model.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/trading_websocket_model.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class TradingPair extends StatefulWidget {
  const TradingPair({super.key});

  @override
  State<TradingPair> createState() => _TradingPairState();
}

class _TradingPairState extends State<TradingPair> {
  TradingWebSocketModel _webSocketModel = TradingWebSocketModel();
  final CoinModel _coinModel = CoinModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      await _webSocketModel.isReady().then((val) {
        if (val) {
          _webSocketModel.subscribeToCoin(['ETH-USD']);
          _webSocketModel.getSocketStream(
            (data) {
              debugPrint(data?.toJson().toString() ?? "asdw");
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [makeDropdown()],
          ),
        ],
      ),
    );
  }

  Widget makeDropdown() {
    return SizedBox(
      height: 18,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          items: _coinModel
              .getAllTitlesCoinUSD()
              .map<DropdownMenuItem<int>>((String value) {
            return DropdownMenuItem(
              value: _coinModel.getAllTitlesCoinUSD().indexOf(value),
              child: Text(
                value,
              ),
            );
          }).toList(),
          style: Theme.of(context).textTheme.labelMedium,
          onChanged: (int? value) {
            setState(() {
              _coinModel.setIndex(value!);
            });
          },
          value: _coinModel.getCurrentIndex(),
          dropdownColor: Theme.of(context).colorScheme.surface,
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
