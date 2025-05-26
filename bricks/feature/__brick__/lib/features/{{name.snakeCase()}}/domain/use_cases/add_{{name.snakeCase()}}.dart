// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/use_cases/use_case.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart';
import 'package:{{project_name}}/features/{{name}}/data/repositories/{{name}}_repository_impl.dart'; // Assure-toi que le chemin est correct

class Add{{name.pascalCase()}} implements UseCase<ApiResponse, TemplateParams> {
  Add{{name.pascalCase()}}(this.{{name.camelCase()}}RepositoryImpl);
  final {{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}RepositoryImpl;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    TemplateParams templateParams,
  ) =>
      {{name.camelCase()}}RepositoryImpl.add{{name.pascalCase()}}(templateParams);
}
