// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/utils/type_convertor/type_convertor.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/data_sources/{{name.snake_case()}}_local_data_source.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/models/{{name.snake_case()}}_model.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/repositories/{{name.snake_case()}}_repository_interface.dart';

class {{name.pascalCase()}}LocalRepositoryImpl
    with Loggable
    implements {{name.pascalCase()}}RepositoryInterface {
  {{name.pascalCase()}}LocalRepositoryImpl({required this.localDataSource});

  final {{name.pascalCase()}}LocalDataSource localDataSource;

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    FieldParams fieldParams,
  ) async {
    try {
      final response = await localDataSource.add{{name.pascalCase()}}(fieldParams);

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
      final response = await localDataSource.delete{{name.pascalCase()}}(urlParams);

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
      final response = await localDataSource.getAll{{name.pascalCase()}}s(noParams);

      if (response['success'] == true) {
        final {{name.snake_case()}}s = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map({{name.pascalCase()}}Model.fromJson)
            .toList();
        final {{name.snake_case()}}sWithPagination = PaginationDataModel.fromJson(
          response['data']['pagination'],
          {{name.snake_case()}}s,
        );

        return Right({{name.snake_case()}}sWithPagination);
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
      final response = await localDataSource.get{{name.pascalCase()}}ById(urlParams);

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
      final response = await localDataSource.update{{name.pascalCase()}}(urlAndFieldParams);

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
