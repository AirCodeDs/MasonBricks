// ignore_for_file: one_member_abstracts

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(NoParams noParams);
}

abstract class {{name.pascalCase()}}SyncDataSource extends {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<void>> Sync{{name.pascalCase()}}s(List<{{name.snakeCase()}}> {{name.snakeCase()}}s);
}

abstract class {{name.pascalCase()}}CoreDataSource extends {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<{{name.snakeCase()}}>> Add{{name.pascalCase()}}(FieldParams fieldParams);
  Future<ApiResponse<{{name.snakeCase()}}>> Update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  );
  Future<ApiResponse<{{name.snakeCase()}}>> Get{{name.pascalCase()}}ById(UrlParams urlParams);
  Future<ApiResponse<void>> Delete{{name.pascalCase()}}(UrlParams urlParams);
}
