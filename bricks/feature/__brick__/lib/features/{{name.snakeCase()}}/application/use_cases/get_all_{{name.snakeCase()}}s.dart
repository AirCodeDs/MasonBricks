// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart'; // Pour le type de retour

class GetAll{{name.pascalCase()}}s
    implements UseCase<Page<List<{{name.snakeCase()}}>>, NoParams> {
  GetAll{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}DataReader _repository;

  @override
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> call(
    NoParams noParams,
  ) => _repository.GetAll{{name.pascalCase()}}s(noParams);
}

class GetAllProductParams extends NoParams {
  GetAllProductParams({super.paginationPageIndex});
}
