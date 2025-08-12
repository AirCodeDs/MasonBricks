// Package imports:
// ignore_for_file: avoid_print, inference_failure_on_untyped_parameter

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/core/converters/freezed_converters.dart';
import 'package:{{project_name}}/core/converters/type_convertor.dart';

// Project imports:

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
abstract class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    @DynamicToStringConverter() required String id,
    required String name,
    required String description,
    required String category,
    @StringOrNumToDoubleConverter() required double price,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(json) =>
      _${{name.pascalCase()}}ModelFromJson(TypeConvertor().convertToMapStringDynamic(json));
}
