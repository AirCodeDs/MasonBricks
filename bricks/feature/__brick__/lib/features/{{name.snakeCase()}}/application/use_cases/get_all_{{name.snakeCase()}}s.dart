// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class GetAll{{name.pascalCase()}}s
    implements UseCase<Page<List<{{name.pascalCase()}}>>, NoParams> {
  GetAll{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}DataReader _repository;

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> call(
    NoParams noParams,
  ) =>
      _repository.getAll{{name.pascalCase()}}s(noParams);
}

class GetAll{{name.pascalCase()}}Params extends NoParams {
  GetAll{{name.pascalCase()}}Params({super.paginationPageIndex});
}


