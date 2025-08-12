import 'dart:async';
import 'package:{{project_name}}/core/logging/app_log.dart';
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/base_{{name.snakeCase()}}_repository/base_{{name.snakeCase()}}_data_reader_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

abstract class Base{{name.pascalCase()}}CoreRepository extends Base{{name.pascalCase()}}DataReaderRepository
    with Loggable
    implements {{name.pascalCase()}}Repository {
  Base{{name.pascalCase()}}CoreRepository(
    this._dataSource,
  ) : super(_dataSource);

  final {{name.pascalCase()}}CoreDataSource _dataSource;
  @override
  Future<ApiResponse<{{name.pascalCase()}}>> add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = await _dataSource.add{{name.pascalCase()}}(fieldParams);
    return response;
  }

  @override
  Future<ApiResponse<void>> delete{{name.pascalCase()}}(
    UrlParams urlParams,
  ) async =>
      _dataSource.delete{{name.pascalCase()}}(urlParams);

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async =>
      _dataSource.getAll{{name.pascalCase()}}s(noParams);

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(
    UrlParams urlParams,
  ) async =>
      _dataSource.get{{name.pascalCase()}}ById(urlParams);

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  ) async =>
      _dataSource.update{{name.pascalCase()}}(urlAndFieldParams);
}


