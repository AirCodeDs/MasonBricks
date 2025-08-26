// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

// ignore: one_member_abstracts
abstract class {{name.pascalCase()}}DataReader {
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(NoParams noParams);
}

/// Synchronization repository for bulk domain sync operations.
abstract class {{name.pascalCase()}}SyncRepository extends {{name.pascalCase()}}DataReader {
  Future<ApiResponse<void>> sync{{name.pascalCase()}}s(
    List<{{name.pascalCase()}}> items,
  );
}

abstract class {{name.pascalCase()}}Repository extends {{name.pascalCase()}}DataReader {
  Future<ApiResponse<{{name.pascalCase()}}>> add{{name.pascalCase()}}(FieldParams fieldParams);

  Future<ApiResponse<{{name.pascalCase()}}>> update{{name.pascalCase()}}(UrlAndFieldParams urlAndFieldParams);

  Future<ApiResponse<void>> delete{{name.pascalCase()}}(UrlParams urlParams);

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(NoParams noParams);

  Future<ApiResponse<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(UrlParams urlParams);
}


