import 'package:json_annotation/json_annotation.dart';

part 'list_crypto_currencies_model.g.dart';

@JsonSerializable()
class CryptoModel {
  const CryptoModel(
      {this.id,
      this.rank,
      this.symbol,
      this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr,
      this.volumeUsd24Hr,
      this.explorer});
  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  final String? id;
  final String? rank;
  final String? symbol;
  final String? name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}

@JsonSerializable()
class CryptoModelList {
  final List<CryptoModel> data;

  const CryptoModelList(this.data);

  factory CryptoModelList.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelListFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoModelListToJson(this);
}
