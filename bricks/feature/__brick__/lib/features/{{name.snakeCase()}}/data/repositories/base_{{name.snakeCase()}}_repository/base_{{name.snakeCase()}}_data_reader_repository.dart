// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

abstract class Base{{name.pascalCase()}}DataReaderRepository
    with Loggable
    implements {{name.pascalCase()}}DataReader {
  Base{{name.pascalCase()}}DataReaderRepository(
    this._dataSource,
  );
  final {{name.pascalCase()}}ReaderDataSource _dataSource;

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async =>
      _dataSource.getAll{{name.pascalCase()}}s(noParams);
}


