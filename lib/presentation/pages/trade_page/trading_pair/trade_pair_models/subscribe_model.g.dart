// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeData _$SubscribeDataFromJson(Map<String, dynamic> json) =>
    SubscribeData(
      json['type'] as String,
      (json['product_ids'] as List<dynamic>).map((e) => e as String).toList(),
      channels: (json['channels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["ticker_batch"],
    );

Map<String, dynamic> _$SubscribeDataToJson(SubscribeData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'product_ids': instance.product_ids,
      'channels': instance.channels,
    };
