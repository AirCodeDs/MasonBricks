// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/config/logs/app_log.dart';
import 'package:{{project_name.snakeCase()}}/core/api_response/api_response.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/failure.dart';
import 'package:{{project_name.snakeCase()}}/core/params/params.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/metadata/pagination_data_model.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/type_convertor/type_convertor.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository_interface.dart';

class {{name.pascalCase()}}RemoteRepositoryImpl
    with Loggable
    implements {{name.pascalCase()}}RepositoryInterface {
  {{name.pascalCase()}}RemoteRepositoryImpl({required this.remoteDataSource});
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    FieldParams fieldParams,
  ) async {
    try {
      final response = await remoteDataSource.add{{name.pascalCase()}}(fieldParams);

      if (response['success'] == true) {
        return Right({{name.pascalCase()}}Model.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(
    UrlParams urlParams,
  ) async {
    try {
      final response = await remoteDataSource.delete{{name.pascalCase()}}(urlParams);

      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>>
  getAll{{name.pascalCase()}}s(NoParams noParams) async {
    try {
      final response = await remoteDataSource.getAll{{name.pascalCase()}}s(noParams);

      if (response['success'] == true) {
        final {{name.snakeCase()}}s = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map({{name.pascalCase()}}Model.fromJson)
            .toList();
        final {{name.snakeCase()}}sWithPagination = PaginationDataModel.fromJson(
          response['data']['pagination'],
          {{name.snakeCase()}}s,
        );

        return Right({{name.snakeCase()}}sWithPagination);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(
    UrlParams urlParams,
  ) async {
    try {
      final response = await remoteDataSource.get{{name.pascalCase()}}ById(urlParams);

      if (response['success'] == true) {
        return Right({{name.pascalCase()}}Model.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  ) async {
    try {
      final response = await remoteDataSource.update{{name.pascalCase()}}(urlAndFieldParams);

      if (response['success'] == true) {
        return Right({{name.pascalCase()}}Model.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }
}
