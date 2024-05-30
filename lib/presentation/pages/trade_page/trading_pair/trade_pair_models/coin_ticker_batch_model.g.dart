// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_ticker_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinTickerBatchModel _$CoinTickerBatchModelFromJson(
        Map<String, dynamic> json) =>
    CoinTickerBatchModel(
      json['type'] as String,
      (json['sequence'] as num).toDouble(),
      json['product_id'] as String,
      json['price'] as String,
      json['open_24h'] as String,
      json['volume_24h'] as String,
      json['low_24h'] as String,
      json['high_24h'] as String,
      json['volume_30d'] as String,
      json['best_bid'] as String,
      json['best_bid_size'] as String,
      json['best_ask'] as String,
      json['best_ask_size'] as String,
      json['side'] as String,
      json['time'] as String,
      (json['trade_id'] as num).toDouble(),
      json['last_size'] as String,
    );

Map<String, dynamic> _$CoinTickerBatchModelToJson(
        CoinTickerBatchModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sequence': instance.sequence,
      'product_id': instance.product_id,
      'price': instance.price,
      'open_24h': instance.open_24h,
      'volume_24h': instance.volume_24h,
      'low_24h': instance.low_24h,
      'high_24h': instance.high_24h,
      'volume_30d': instance.volume_30d,
      'best_bid': instance.best_bid,
      'best_bid_size': instance.best_bid_size,
      'best_ask': instance.best_ask,
      'best_ask_size': instance.best_ask_size,
      'side': instance.side,
      'time': instance.time,
      'trade_id': instance.trade_id,
      'last_size': instance.last_size,
    };
