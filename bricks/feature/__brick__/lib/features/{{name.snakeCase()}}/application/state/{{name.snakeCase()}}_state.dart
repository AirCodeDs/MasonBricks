// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_state.freezed.dart';

enum {{name.pascalCase()}}Operation {
  fetch{{name.pascalCase()}}s,
  Add{{name.pascalCase()}},
  Update{{name.pascalCase()}},
  Delete{{name.pascalCase()}},
  Get{{name.pascalCase()}}ById,
}

enum OperationStatus { idle, loading, success, error }

@freezed
abstract class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default([]) List<{{name.snakeCase()}}> {{name.snakeCase()}}s,
    @Default({}) Map<{{name.pascalCase()}}Operation, OperationStatus> operationStatuses,
    @Default({}) Map<{{name.pascalCase()}}Operation, String?> errors,
  }) = _{{name.pascalCase()}}State;
}
