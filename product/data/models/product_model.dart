// Package imports:
// ignore_for_file: avoid_print, inference_failure_on_untyped_parameter

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @DynamicToStringConverter() required String id,
    required String name,
    required String description,
    required String category,
    @StringOrNumToDoubleConverter() required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(json) =>
      _$ProductModelFromJson(TypeConvertor().convertToMapStringDynamic(json));
}
