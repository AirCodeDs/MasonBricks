// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_{{name.pascalCase()}}Model _${{name.pascalCase()}}ModelFromJson(Map<String, dynamic> json) =>
    _{{name.pascalCase()}}Model(
      id: const DynamicToStringConverter().fromJson(json['id']),
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: const StringOrNumToDoubleConverter().fromJson(json['price']),
    );

Map<String, dynamic> _${{name.pascalCase()}}ModelToJson(_{{name.pascalCase()}}Model instance) =>
    <String, dynamic>{
      'id': const DynamicToStringConverter().toJson(instance.id),
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': const StringOrNumToDoubleConverter().toJson(instance.price),
    };
