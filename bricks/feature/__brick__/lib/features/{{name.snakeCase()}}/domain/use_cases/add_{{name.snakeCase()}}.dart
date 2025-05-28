// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{name.snakeCase()}}/core/errors/failure.dart';
import 'package:{{name.snakeCase()}}/core/params/params.dart';
import 'package:{{name.snakeCase()}}/core/use_cases/use_case.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository_interface.dart';

class Add{{name.pascalCase()}} extends UseCase<{{name.pascalCase()}}Model, Add{{name.pascalCase()}}Params> {
  Add{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    Add{{name.pascalCase()}}Params add{{name.pascalCase()}}Params,
  ) => _repository.add{{name.pascalCase()}}(add{{name.pascalCase()}}Params);
}

class Add{{name.pascalCase()}}Params extends FieldParams {
  Add{{name.pascalCase()}}Params({
    required String fieldParam1,
    required String fieldParam2,
    String? fieldParam3,
  }) : super(
         fieldParams: {
           'fieldParam1': fieldParam1,
           'fieldParam2': fieldParam2,
           if (fieldParam3 != null) 'fieldParam3': fieldParam3,
         },
       );
}
