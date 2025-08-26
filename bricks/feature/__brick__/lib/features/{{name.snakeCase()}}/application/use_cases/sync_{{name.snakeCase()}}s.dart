// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Sync{{name.pascalCase()}}s extends UseCase<void, Sync{{name.pascalCase()}}sParams> {
  Sync{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}SyncRepository _repository;

  @override
  Future<ApiResponse<void>> call(Sync{{name.pascalCase()}}sParams Sync{{name.pascalCase()}}sParams) =>
      _repository.Sync{{name.pascalCase()}}s(Sync{{name.pascalCase()}}sParams.{{name.snakeCase()}}s);
}

class Sync{{name.pascalCase()}}sParams extends SyncParams<{{name.snakeCase()}}> {
  Sync{{name.pascalCase()}}sParams({required this.{{name.snakeCase()}}s}) : super(params: {{name.snakeCase()}}s);
  final List<{{name.snakeCase()}}> {{name.snakeCase()}}s;
}
