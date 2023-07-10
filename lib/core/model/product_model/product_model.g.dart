// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      title: json['title'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      brand: json['brand'] as String,
      discount: json['discount'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'brand': instance.brand,
      'discount': instance.discount,
      'description': instance.description,
    };

CardProductModel _$CardProductModelFromJson(Map<String, dynamic> json) =>
    CardProductModel(
      title: json['title'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as String,
      totalBoughtPrice: json['totalBoughtPrice'] as String,
    );

Map<String, dynamic> _$CardProductModelToJson(CardProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'brand': instance.brand,
      'description': instance.description,
      'quantity': instance.quantity,
      'totalBoughtPrice': instance.totalBoughtPrice,
    };
