import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  const Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  const Rating({this.rate, this.count});
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  final int? rate;
  final int? count;

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
