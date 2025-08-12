// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/interfaces/use_case.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class GetAll{{name.pascalCase()}}s
    implements UseCase<PaginationDataModel<List<{{name.pascalCase()}}>>, NoParams> {
  GetAll{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}DataReader _repository;

  @override
  Future<ApiResponse<PaginationDataModel<List<{{name.pascalCase()}}>>>> call(
    NoParams noParams,
  ) =>
      _repository.getAll{{name.pascalCase()}}s(noParams);
}

class GetAll{{name.pascalCase()}}Params extends NoParams {
  GetAll{{name.pascalCase()}}Params({super.paginationPageIndex});
}


