// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/base_product_repository/base_product_data_reader_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

abstract class BaseProductCoreRepository extends Base{{name.pascalCase()}}DataReaderRepository
    with Loggable
    implements {{name.pascalCase()}}Repository {
  BaseProductCoreRepository(this._dataSource) : super(_dataSource);

  final {{name.pascalCase()}}CoreDataSource _dataSource;
  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = await _dataSource.Add{{name.pascalCase()}}(fieldParams);
    return response;
  }

  @override
  Future<ApiResponse<void>> Delete{{name.pascalCase()}}(UrlParams urlParams) async =>
      _dataSource.Delete{{name.pascalCase()}}(urlParams);

  @override
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async => _dataSource.GetAll{{name.pascalCase()}}s(noParams);

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Get{{name.pascalCase()}}ById(UrlParams urlParams) async =>
      _dataSource.Get{{name.pascalCase()}}ById(urlParams);

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  ) async => _dataSource.Update{{name.pascalCase()}}(urlAndFieldParams);
}
