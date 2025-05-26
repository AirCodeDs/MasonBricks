// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/constants/error_text_string.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/utils/models/pagination_data_model.dart';
import 'package:{{project_name}}/core/utils/type_convertor/type_convertor.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart';
import 'package:{{project_name}}/features/{{name}}/domain/repositories/{{name}}_repository.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.mockDataSource,
    this.useRemote = true,
    this.useMock = false,
  });
  
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final {{name.pascalCase()}}MockDataSource mockDataSource;
  final bool useRemote;
  final bool useMock;
  
  // Helper method to determine which data source to use
  dynamic getDataSource() {
    if (useMock) return mockDataSource;
    if (useRemote) return remoteDataSource;
    return localDataSource;
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    TemplateParams templateParams,
  ) async {
    try {
      final dataSource = getDataSource();
      final response = await dataSource.add{{name.pascalCase()}}(
        templateParams,
      );
      
      if (response['success'] == true) {
       return Right({{name.pascalCase()}}Model.fromMap(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(ParamOne paramOne) async {
    try {
      final dataSource = getDataSource();
      final response = await dataSource.delete{{name.pascalCase()}}(
        paramOne,
      );
      
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async {
    try {
      final dataSource = getDataSource();
      final response = await dataSource.getAll{{name.pascalCase()}}s(
        noParams,
      );
      
      if (response['success'] == true) {
        final {{name.camelCase()}}s = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map({{name.pascalCase()}}Model.fromMap)
            .toList();
        final {{name.camelCase()}}sWithPagination =
            PaginationDataModel.fromMap(response['data']['pagination'], {{name.camelCase()}}s);

        return Right({{name.camelCase()}}sWithPagination);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(
    ParamOne paramOne,
  ) async {
    try {
      final dataSource = getDataSource();
      final response = await dataSource.get{{name.pascalCase()}}ById(
        paramOne,
      );

      if (response['success'] == true) {
         return Right({{name.pascalCase()}}Model.fromMap(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(
    TemplateParams templateParams,
  ) async {
    try {
      final dataSource = getDataSource();
      final response = await dataSource.update{{name.pascalCase()}}(
        templateParams,
      );
      
      if (response['success'] == true) {
       return Right({{name.pascalCase()}}.fromMap(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }
}


