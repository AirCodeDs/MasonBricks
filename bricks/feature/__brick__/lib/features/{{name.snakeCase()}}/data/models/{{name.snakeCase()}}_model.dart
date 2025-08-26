// ignore_for_file: avoid_print, inference_failure_on_untyped_parameter

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
