// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_crypto_currencies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      id: json['id'] as String?,
      rank: json['rank'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      supply: json['supply'] as String?,
      maxSupply: json['maxSupply'] as String?,
      marketCapUsd: json['marketCapUsd'] as String?,
      priceUsd: json['priceUsd'] as String?,
      changePercent24Hr: json['changePercent24Hr'] as String?,
      vwap24Hr: json['vwap24Hr'] as String?,
      volumeUsd24Hr: json['volumeUsd24Hr'] as String?,
      explorer: json['explorer'] as String?,
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'symbol': instance.symbol,
      'name': instance.name,
      'supply': instance.supply,
      'maxSupply': instance.maxSupply,
      'marketCapUsd': instance.marketCapUsd,
      'volumeUsd24Hr': instance.volumeUsd24Hr,
      'priceUsd': instance.priceUsd,
      'changePercent24Hr': instance.changePercent24Hr,
      'vwap24Hr': instance.vwap24Hr,
      'explorer': instance.explorer,
    };

CryptoModelList _$CryptoModelListFromJson(Map<String, dynamic> json) =>
    CryptoModelList(
      (json['data'] as List<dynamic>)
          .map((e) => CryptoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoModelListToJson(CryptoModelList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
