// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RepositoryInterface {
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(FieldParams fieldParams);

  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  );

  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(UrlParams urlParams);

  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>>
  getAll{{name.pascalCase()}}s(NoParams noParams);

  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(UrlParams urlParams);
}
