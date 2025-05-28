// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/core/errors/failure.dart';
import 'package:{{project_name.snakeCase()}}/core/params/params.dart';
import 'package:{{project_name.snakeCase()}}/core/use_cases/use_case.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository_interface.dart';

import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart'; // Pour le type de retour

class Update{{name.pascalCase()}} extends UseCase<{{name.pascalCase()}}Model, Update{{name.pascalCase()}}Params> {
  Update{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    Update{{name.pascalCase()}}Params update{{name.pascalCase()}}Params,
  ) => _repository.update{{name.pascalCase()}}(update{{name.pascalCase()}}Params);
}

class Update{{name.pascalCase()}}Params extends UrlAndFieldParams {
  Update{{name.pascalCase()}}Params({
    required String fieldParam1,
    required String fieldParam2,
    required String urlParam1,
    String? fieldParam3,
    String? urlParam2,
  }) : super(
         urlParams: [urlParam1, if (urlParam2 != null) urlParam2],
         fieldParams: {
           'fieldParam1': fieldParam1,
           'fieldParam2': fieldParam2,
           if (fieldParam3 != null) 'fieldParam3': fieldParam3,
         },
       );
}
