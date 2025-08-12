// ignore_for_file: one_member_abstracts

import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  );
}

abstract class {{name.pascalCase()}}SyncDataSource extends {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<void>> sync{{name.pascalCase()}}s(
    List<{{name.pascalCase()}}> items,
  );
}

abstract class {{name.pascalCase()}}CoreDataSource extends {{name.pascalCase()}}ReaderDataSource {
  Future<ApiResponse<{{name.pascalCase()}}>> add{{name.pascalCase()}}(FieldParams fieldParams);
  Future<ApiResponse<{{name.pascalCase()}}>> update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  );
  Future<ApiResponse<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(UrlParams urlParams);
  Future<ApiResponse<void>> delete{{name.pascalCase()}}(UrlParams urlParams);
}


