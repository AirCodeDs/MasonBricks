// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/constants/error_text_string.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/network/netwok_info.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/utils/models/pagination_data_model.dart';
import 'package:{{project_name}}/core/utils/type_convertor/type_convertor.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart';
import 'package:{{project_name}}/features/{{name}}/domain/repositories/{{name}}_repository.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_data_source_interface.dart';

class {{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl implements {{name.pascalCase()}}RepositoryInterface {
  {{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  {{name.pascalCase()}}DataSourceInterface _getDataSource() {
   return networkInfo.isConnected? remoteDataSource : localDataSource;
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    BodyParams bodyParams,
  ) async {
    try {
      final response = await remoteDataSource.add{{name.pascalCase()}}(
        bodyParams,
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
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(UrlParams urlParams) async {
    try {
     
      final response = await remoteDataSource.delete{{name.pascalCase()}}(
        urlParam,
      );
      
      if (response['success'] == true) {
       final response = await localDataSource.delete{{name.pascalCase()}}(
        urlParam,
       );
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
      final response = await _getDataSource.getAll{{name.pascalCase()}}s(
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
    UrlParams urlParams,
  ) async {
    try {
    
      final response = await _getDataSource.get{{name.pascalCase()}}ById(
        urlParam,
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
    UrlAndBodyParams urlAndBodyParams,
  ) async {
    try {
      final response = await remoteDataSource.update{{name.pascalCase()}}(
        urlAndBodyParams,
      );
      
      if (response['success'] == true) {
          final response = await localDataSource.update{{name.pascalCase()}}(
            urlAndBodyParams,
          );
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
}






