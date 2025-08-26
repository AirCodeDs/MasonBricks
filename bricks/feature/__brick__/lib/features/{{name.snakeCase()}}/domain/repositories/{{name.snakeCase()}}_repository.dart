// Project imports:

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

// ignore: one_member_abstracts
abstract class {{name.pascalCase()}}DataReader {
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(NoParams noParams);
}

/// Synchronization repository for bulk domain sync operations.
abstract class {{name.pascalCase()}}SyncRepository extends {{name.pascalCase()}}DataReader {
  Future<ApiResponse<void>> Sync{{name.pascalCase()}}s(List<{{name.snakeCase()}}> {{name.snakeCase()}}s);
}

abstract class {{name.pascalCase()}}Repository extends {{name.pascalCase()}}DataReader {
  Future<ApiResponse<{{name.snakeCase()}}>> Add{{name.pascalCase()}}(FieldParams fieldParams);

  Future<ApiResponse<{{name.snakeCase()}}>> Update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  );

  Future<ApiResponse<void>> Delete{{name.pascalCase()}}(UrlParams urlParams);

  @override
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(NoParams noParams);

  Future<ApiResponse<{{name.snakeCase()}}>> Get{{name.pascalCase()}}ById(UrlParams urlParams);
}
