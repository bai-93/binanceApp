// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_history_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoHistoryPriceModel _$CryptoHistoryPriceModelFromJson(
        Map<String, dynamic> json) =>
    CryptoHistoryPriceModel(
      json['priceUsd'] as String,
      (json['time'] as num).toInt(),
      json['date'] as String,
    );

Map<String, dynamic> _$CryptoHistoryPriceModelToJson(
        CryptoHistoryPriceModel instance) =>
    <String, dynamic>{
      'priceUsd': instance.priceUsd,
      'time': instance.time,
      'date': instance.date,
    };

CryptoHistoryPriceListModel _$CryptoHistoryPriceListModelFromJson(
        Map<String, dynamic> json) =>
    CryptoHistoryPriceListModel(
      (json['data'] as List<dynamic>)
          .map((e) =>
              CryptoHistoryPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoHistoryPriceListModelToJson(
        CryptoHistoryPriceListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
