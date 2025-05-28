// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import package:{{project_name.snakeCase()}}/core/errors/failure.dart';
import package:{{project_name.snakeCase()}}/core/params/params.dart';
import package:{{project_name.snakeCase()}}/core/use_cases/use_case.dart';
import package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';

import package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository_interface.dart'; // Pour le type de retour

class Get{{name.pascalCase()}}ById extends UseCase<{{name.pascalCase()}}Model, Get{{name.pascalCase()}}ByIdParams> {
  Get{{name.pascalCase()}}ById(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    Get{{name.pascalCase()}}ByIdParams get{{name.pascalCase()}}ByIdParams,
  ) => _repository.get{{name.pascalCase()}}ById(get{{name.pascalCase()}}ByIdParams);
}

class Get{{name.pascalCase()}}ByIdParams extends UrlParams {
  Get{{name.pascalCase()}}ByIdParams({
    required String urlParam1,
    required String urlParam2,
    String? urlParam3,
    //  int? paginationPageIndex,
  }) : super(
         urlParams: [
           urlParam1,
           urlParam2,
           urlParam3,
         ].whereType<String>().toList(),
         // paginationPageIndex: paginationPageIndex,
       );
}
