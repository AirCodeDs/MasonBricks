import 'package:{{project_name}}/core/logging/app_log.dart';
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/core/params/params.dart';
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


