import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_state.freezed.dart';

enum {{name.pascalCase()}}Operation {
  fetch{{name.pascalCase()}}s,
  add{{name.pascalCase()}},
  update{{name.pascalCase()}},
  delete{{name.pascalCase()}},
  get{{name.pascalCase()}}ById,
}

enum OperationStatus { idle, loading, success, error }

@freezed
abstract class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default([]) List<{{name.pascalCase()}}> {{name.snakeCase()}}s,
    @Default({}) Map<{{name.pascalCase()}}Operation, OperationStatus> operationStatuses,
    @Default({}) Map<{{name.pascalCase()}}Operation, String?> errors,
  }) = _{{name.pascalCase()}}State;
}
