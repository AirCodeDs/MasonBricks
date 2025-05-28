// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';

import 'package:urban_transport/features/{{name.snake_case()}}/domain/repositories/{{name.snake_case()}}_repository_interface.dart'; // Assure-toi que le chemin est correct

class Delete{{name.pascalCase()}} implements UseCase<ApiResponse, Delete{{name.pascalCase()}}Params> {
  Delete{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, ApiResponse>> call(
    Delete{{name.pascalCase()}}Params delete{{name.pascalCase()}}Params,
  ) => _repository.delete{{name.pascalCase()}}(delete{{name.pascalCase()}}Params);
}

class Delete{{name.pascalCase()}}Params extends UrlParams {
  Delete{{name.pascalCase()}}Params({
    required String urlParam1,
    required String urlParam2,
    String? urlParam3,
  }) : super(
         urlParams: [
           urlParam1,
           urlParam2,
           urlParam3,
         ].whereType<String>().toList(),
       );
}
