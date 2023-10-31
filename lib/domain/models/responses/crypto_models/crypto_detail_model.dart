import 'package:json_annotation/json_annotation.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
part 'crypto_detail_model.g.dart';

@JsonSerializable()
class CryptoDetailModel {
  final CryptoModel data;
  const CryptoDetailModel(this.data);

  factory CryptoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoDetailModelToJson(this);
}
