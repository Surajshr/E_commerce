import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String title;
  final String price;
  final String image;
  final String brand;
  final String discount;
  final String description;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.brand,
    required this.discount,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class CardProductModel {
  final String title;
  final String price;
  final String image;
  final String brand;
  final String description;
  final String quantity;
  final String totalBoughtPrice;

  CardProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.brand,
    required this.description,
    required this.quantity,
    required this.totalBoughtPrice,
  });

  factory CardProductModel.fromJson(Map<String, dynamic> json) =>
      _$CardProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardProductModelToJson(this);
}
