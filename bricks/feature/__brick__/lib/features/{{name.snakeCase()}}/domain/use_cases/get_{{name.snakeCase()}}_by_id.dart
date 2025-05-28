// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/models/{{name.snake_case()}}_model.dart';

import 'package:urban_transport/features/{{name.snake_case()}}/domain/repositories/{{name.snake_case()}}_repository_interface.dart'; // Pour le type de retour

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
