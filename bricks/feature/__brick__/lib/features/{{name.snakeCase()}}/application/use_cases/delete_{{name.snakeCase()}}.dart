// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Delete{{name.pascalCase()}} implements UseCase<void, Delete{{name.pascalCase()}}Params> {
  Delete{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<ApiResponse<void>> call(
    Delete{{name.pascalCase()}}Params params,
  ) =>
      _repository.delete{{name.pascalCase()}}(params);
}

class Delete{{name.pascalCase()}}Params extends UrlParams {
  Delete{{name.pascalCase()}}Params({
    required String id,
  }) : super(
          urlParams: [id].whereType<String>().toList(),
        );
}


