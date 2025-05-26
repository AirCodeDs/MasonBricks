// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/use_cases/use_case.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart'; // Pour le type de retour
import 'package:{{project_name}}/features/{{name}}/data/repositories/{{name}}_repository_impl.dart'; // Assure-toi que le chemin est correct

class Get{{name.pascalCase()}}ById implements UseCase<{{name.pascalCase()}}Model, ParamOne> {
  Get{{name.pascalCase()}}ById(this.{{name.camelCase()}}RepositoryImpl);
  final {{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}RepositoryImpl;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    ParamOne paramOne,
  ) =>
      {{name.camelCase()}}RepositoryImpl.get{{name.pascalCase()}}ById(paramOne);
}
