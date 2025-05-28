// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:urban_transport/core/utils/type_convertor/type_convertor.dart';

part '{{name.snake_case()}}_model.freezed.dart';
part '{{name.snake_case()}}_model.g.dart';

@freezed
abstract class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({required String id}) = _{{name.pascalCase()}}Model;

  // ignore: avoid_annotating_with_dynamic
  factory {{name.pascalCase()}}Model.fromJson(dynamic json) =>
      _${{name.pascalCase()}}ModelFromJson(TypeConvertor().convertToMapStringDynamic(json));
}
