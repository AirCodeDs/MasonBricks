// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:urban_transport/core/utils/type_convertor/type_convertor.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
  }) = _ProductModel;

  // ignore: avoid_annotating_with_dynamic
  factory ProductModel.fromJson(dynamic json) =>
      _$ProductModelFromJson(TypeConvertor().convertToMapStringDynamic(json));
}
