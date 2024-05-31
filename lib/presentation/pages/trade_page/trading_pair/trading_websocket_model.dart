import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/trade_page/trading_pair/trade_pair_models/coin_ticker_batch_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'trade_pair_models/subscribe_model.dart';

typedef _successCallbackWebSocket = Function(CoinTickerBatchModel? item)?;
typedef _failureCallbackWebSocket = Function()?;

class TradingWebSocketModel {
  late WebSocketChannel _socketChannel;
  List<String> coinCurrency = [];

  TradingWebSocketModel();

  Future<bool> _connection() async {
    try {
      _socketChannel =
          WebSocketChannel.connect(Uri.parse('wss://ws-feed.pro.coinbase.com'));
      await _socketChannel.ready;
    } catch (e) {
      return false;
    }
    debugPrint("yes SOCKET IS READY");
    return true;
  }

  Future<bool> isReady() async {
    return await _connection();
  }

  Future closeConnection() async {
    return await _socketChannel.sink.close();
  }

  void subscribeToCoin(List<String> productIds) {
    if (coinCurrency.isNotEmpty) {
      _unSubscribe();
    }
    String data = jsonEncode(SubscribeData('subscribe', productIds));
    coinCurrency = productIds;
    _socketChannel.sink.add(data);
  }

  void _unSubscribe() {
    _socketChannel.sink
        .add(jsonEncode(SubscribeData('unsubscribe', coinCurrency)));
  }

  void getSocketStream(_successCallbackWebSocket successCallback,
      _failureCallbackWebSocket failCallback) async {
    CoinTickerBatchModel? dataObject;
    _socketChannel.stream.map<String>((data) {
      return data;
    }).listen((data) {
      Map<String, dynamic> toMap = jsonDecode(data);
      if (toMap['type'] == 'ticker') {
        dataObject = CoinTickerBatchModel.fromJson(toMap);
        successCallback?.call(dataObject);
      } else {
        failCallback?.call();
      }
    }, onDone: () {
      debugPrint("on done");
    }, onError: (error) {
      debugPrint("HERE IS ERROR of STREAM");
      debugPrint(error);
    });
  }

// SUBSCRIBE
//   {
//   "type": "subscribe",
//   "product_ids": ["BTC-USD","ETH-EUR"],
//   "channels": [
// 		"ticker_batch"
//   ]
// }

// UNSUBSCRIBE
// {
//   "type": "unsubscribe",
//   "channels": ["heartbeat"]
// }
}
