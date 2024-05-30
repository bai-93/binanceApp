import 'package:json_annotation/json_annotation.dart';

part 'subscribe_model.g.dart';

@JsonSerializable()
class SubscribeData {
  String type;
  List<String> product_ids;
  List<String> channels;

  SubscribeData(this.type, this.product_ids,
      {this.channels = const ["ticker_batch"]});
  factory SubscribeData.fromJson(Map<String, dynamic> json) =>
      _$SubscribeDataFromJson(json);
  Map<String, dynamic> toJson() => _$SubscribeDataToJson(this);
}
