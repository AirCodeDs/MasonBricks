// Project imports:
import package:{{project_name.snakeCase()}}/core/params/params.dart';

abstract class {{name.pascalCase()}}DataSourceInterface {
  Future<dynamic> add{{name.pascalCase()}}(FieldParams fieldParams);
  Future<dynamic> update{{name.pascalCase()}}(UrlAndFieldParams urlAndFieldParams);
  Future<dynamic> getAll{{name.pascalCase()}}s(NoParams noParams);
  Future<dynamic> get{{name.pascalCase()}}ById(UrlParams urlParams);
  Future<dynamic> delete{{name.pascalCase()}}(UrlParams urlParams);
}
