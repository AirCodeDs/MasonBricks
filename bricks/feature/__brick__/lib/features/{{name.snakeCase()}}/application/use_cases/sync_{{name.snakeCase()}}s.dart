import 'package:{{project_name}}/core/api_response/api_response.dart';

// Project imports:
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/interfaces/use_case.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Sync{{name.pascalCase()}}s extends UseCase<void, Sync{{name.pascalCase()}}sParams> {
  Sync{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}SyncRepository _repository;

  @override
  Future<ApiResponse<void>> call(
    Sync{{name.pascalCase()}}sParams params,
  ) =>
      _repository.sync{{name.pascalCase()}}s(params.items);
}

class Sync{{name.pascalCase()}}sParams extends SyncParams<{{name.pascalCase()}}> {
  Sync{{name.pascalCase()}}sParams({
    required this.items,
  }) : super(params: items);
  final List<{{name.pascalCase()}}> items;
}


