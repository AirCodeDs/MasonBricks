import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

extension {{name.pascalCase()}}StateX on {{name.pascalCase()}}State {
  {{name.pascalCase()}}State withLoading({{name.pascalCase()}}Operation op) => copyWith(
        operationStatuses: {
          ...operationStatuses,
          op: OperationStatus.loading,
        },
        errors: {
          ...errors,
          op: null,
        },
      );

  {{name.pascalCase()}}State withSuccess({{name.pascalCase()}}Operation op, {List<{{name.pascalCase()}}>? items}) =>
      copyWith(
        {{name.snakeCase()}}s: items ?? this.{{name.snakeCase()}}s,
        operationStatuses: {
          ...operationStatuses,
          op: OperationStatus.success,
        },
        errors: {
          ...errors,
          op: null,
        },
      );

  {{name.pascalCase()}}State withError({{name.pascalCase()}}Operation op, String message) => copyWith(
        operationStatuses: {
          ...operationStatuses,
          op: OperationStatus.error,
        },
        errors: {
          ...errors,
          op: message,
        },
      );

  {{name.pascalCase()}}State withIdle({{name.pascalCase()}}Operation op) => copyWith(
        operationStatuses: {
          ...operationStatuses,
          op: OperationStatus.idle,
        },
        errors: {
          ...errors,
          op: null,
        },
      );

  bool isLoading({{name.pascalCase()}}Operation op) =>
      operationStatuses[op] == OperationStatus.loading;
  bool isSuccess({{name.pascalCase()}}Operation op) =>
      operationStatuses[op] == OperationStatus.success;
  bool isError({{name.pascalCase()}}Operation op) =>
      operationStatuses[op] == OperationStatus.error;
  String? errorMessage({{name.pascalCase()}}Operation op) => errors[op];
}

extension {{name.pascalCase()}}StateFlags on {{name.pascalCase()}}State {
  bool get isLoadingAdd{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.add{{name.pascalCase()}}] == OperationStatus.loading;
  bool get isSuccessAdd{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.add{{name.pascalCase()}}] == OperationStatus.success;
  bool get isErrorAdd{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.add{{name.pascalCase()}}] == OperationStatus.error;
  String? get errorAdd{{name.pascalCase()}} => errors[{{name.pascalCase()}}Operation.add{{name.pascalCase()}}];

  bool get isLoadingFetch{{name.pascalCase()}}s =>
      operationStatuses[{{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s] == OperationStatus.loading;
  bool get isSuccessFetch{{name.pascalCase()}}s =>
      operationStatuses[{{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s] == OperationStatus.success;
  bool get isErrorFetch{{name.pascalCase()}}s =>
      operationStatuses[{{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s] == OperationStatus.error;
  bool get isItemsEmpty => {{name.snakeCase()}}s.isEmpty;
  String? get errorFetch{{name.pascalCase()}}s => errors[{{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s];

  bool get isLoadingUpdate{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.update{{name.pascalCase()}}] == OperationStatus.loading;
  bool get isSuccessUpdate{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.update{{name.pascalCase()}}] == OperationStatus.success;
  bool get isErrorUpdate{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.update{{name.pascalCase()}}] == OperationStatus.error;
  String? get errorUpdate{{name.pascalCase()}} => errors[{{name.pascalCase()}}Operation.update{{name.pascalCase()}}];

  bool get isLoadingDelete{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.delete{{name.pascalCase()}}] == OperationStatus.loading;
  bool get isSuccessDelete{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.delete{{name.pascalCase()}}] == OperationStatus.success;
  bool get isErrorDelete{{name.pascalCase()}} =>
      operationStatuses[{{name.pascalCase()}}Operation.delete{{name.pascalCase()}}] == OperationStatus.error;
  String? get errorDelete{{name.pascalCase()}} => errors[{{name.pascalCase()}}Operation.delete{{name.pascalCase()}}];

  bool get isLoadingGet{{name.pascalCase()}}ById =>
      operationStatuses[{{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById] == OperationStatus.loading;
  bool get isSuccessGet{{name.pascalCase()}}ById =>
      operationStatuses[{{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById] == OperationStatus.success;
  bool get isErrorGet{{name.pascalCase()}}ById =>
      operationStatuses[{{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById] == OperationStatus.error;
  String? get errorGet{{name.pascalCase()}}ById => errors[{{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById];

  {{name.pascalCase()}}State clearOperation({{name.pascalCase()}}Operation op) => copyWith(
        operationStatuses: Map<{{name.pascalCase()}}Operation, OperationStatus>.from(
          operationStatuses,
        )..remove(op),
        errors: Map<{{name.pascalCase()}}Operation, String?>.from(errors)..remove(op),
      );

  {{name.pascalCase()}}State withClearedErrors() => copyWith(
        errors: const {},
      );
}



