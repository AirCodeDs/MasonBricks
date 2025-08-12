// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/interfaces/use_case.dart';
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


