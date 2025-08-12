// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: const DynamicToStringConverter().fromJson(json['id']),
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: const StringOrNumToDoubleConverter().fromJson(json['price']),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': const DynamicToStringConverter().toJson(instance.id),
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': const StringOrNumToDoubleConverter().toJson(instance.price),
    };
