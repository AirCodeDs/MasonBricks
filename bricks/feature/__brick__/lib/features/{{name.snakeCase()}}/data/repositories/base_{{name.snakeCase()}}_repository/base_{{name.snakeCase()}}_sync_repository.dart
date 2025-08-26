// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/base_{{name.snakeCase()}}_repository/base_{{name.snakeCase()}}_data_reader_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

abstract class Base{{name.pascalCase()}}SyncRepository extends Base{{name.pascalCase()}}DataReaderRepository
    implements {{name.pascalCase()}}SyncRepository {
  Base{{name.pascalCase()}}SyncRepository(
    this._dataSource,
  ) : super(_dataSource);
  final {{name.pascalCase()}}SyncDataSource _dataSource;

  @override
  Future<ApiResponse<void>> sync{{name.pascalCase()}}s(
    List<{{name.pascalCase()}}> items,
  ) async =>
      _dataSource.sync{{name.pascalCase()}}s(items);
}


