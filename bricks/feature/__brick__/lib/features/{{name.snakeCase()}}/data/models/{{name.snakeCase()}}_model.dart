// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/core/utils/type_convertor/type_convertor.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
abstract class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({required String id}) = _{{name.pascalCase()}}Model;

  // ignore: avoid_annotating_with_dynamic
  factory {{name.pascalCase()}}Model.fromJson(dynamic json) =>
      _${{name.pascalCase()}}ModelFromJson(TypeConvertor().convertToMapStringDynamic(json));
}
