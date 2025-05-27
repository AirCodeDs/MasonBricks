import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}DataSource {
  Future<dynamic> add{{name.pascalCase()}} (BodyParams bodyParams);
  Future<dynamic> update{{name.pascalCase()}} (UrlAndBodyParams urlAndBodyParams);
  Future<dynamic> getAll{{name.pascalCase()}}s (NoParams noParams);
  Future<dynamic> get{{name.pascalCase()}}ById (UrlParams urlParams);
  Future<dynamic> delete{{name.pascalCase()}} (UrlParams urlParams);
}
