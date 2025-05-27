import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/use_cases/use_case.dart';
import 'package:{{project_name}}/features/{{name}}/data/domaine/repositories/{{name}}_repository_interface.dart'; // Assure-toi que le chemin est correct

class Delete{{name.pascalCase()}} implements UseCase<ApiResponse, UrlParam> {
  Delete{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, ApiResponse>> call(
    UrlParams urlParams,
  ) =>
      _repository.delete{{name.pascalCase()}}(urlParam);
}
