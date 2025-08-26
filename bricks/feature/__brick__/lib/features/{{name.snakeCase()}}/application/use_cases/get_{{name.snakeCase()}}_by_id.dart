// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}}ById extends UseCase<{{name.pascalCase()}}, Get{{name.pascalCase()}}ByIdParams> {
  Get{{name.pascalCase()}}ById(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<ApiResponse<{{name.pascalCase()} }>> call(
    Get{{name.pascalCase()}}ByIdParams params,
  ) =>
      _repository.get{{name.pascalCase()}}ById(params);
}

class Get{{name.pascalCase()}}ByIdParams extends UrlParams {
  Get{{name.pascalCase()}}ByIdParams({
    required String id,
  }) : super(
          urlParams: [id].whereType<String>().toList(),
        );
}


