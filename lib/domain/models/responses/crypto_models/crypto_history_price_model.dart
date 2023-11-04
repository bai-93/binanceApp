import 'package:json_annotation/json_annotation.dart';
part 'crypto_history_price_model.g.dart';

@JsonSerializable()
class CryptoHistoryPriceModel {
  final String priceUsd;
  final int time;
  final String date;

  const CryptoHistoryPriceModel(this.priceUsd, this.time, this.date);
  factory CryptoHistoryPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoHistoryPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoHistoryPriceModelToJson(this);
}

@JsonSerializable()
class CryptoHistoryPriceListModel {
  final List<CryptoHistoryPriceModel> data;

  const CryptoHistoryPriceListModel(this.data);
  factory CryptoHistoryPriceListModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoHistoryPriceListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoHistoryPriceListModelToJson(this);
}
