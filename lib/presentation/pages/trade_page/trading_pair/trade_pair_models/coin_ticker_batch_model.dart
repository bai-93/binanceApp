import 'package:json_annotation/json_annotation.dart';
part 'coin_ticker_batch_model.g.dart';

@JsonSerializable()
class CoinTickerBatchModel {
  final String type;
  final double sequence;
  final String product_id;
  final String price;
  final String open_24h;
  final String volume_24h;
  final String low_24h;
  final String high_24h;
  final String volume_30d;
  final String best_bid;
  final String best_bid_size;
  final String best_ask;
  final String best_ask_size;
  final String side;
  final String time;
  final double trade_id;
  final String last_size;

  const CoinTickerBatchModel(
      this.type,
      this.sequence,
      this.product_id,
      this.price,
      this.open_24h,
      this.volume_24h,
      this.low_24h,
      this.high_24h,
      this.volume_30d,
      this.best_bid,
      this.best_bid_size,
      this.best_ask,
      this.best_ask_size,
      this.side,
      this.time,
      this.trade_id,
      this.last_size);

  factory CoinTickerBatchModel.fromJson(Map<String, dynamic> json) =>
      _$CoinTickerBatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinTickerBatchModelToJson(this);
}
