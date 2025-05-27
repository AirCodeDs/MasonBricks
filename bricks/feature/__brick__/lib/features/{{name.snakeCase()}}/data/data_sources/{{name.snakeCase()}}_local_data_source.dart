import 'package:{{project_name}}/config/logs/app_log.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/services/api/local_api/local_api.dart';
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_data_source_interface.dart';
class {{name.pascalCase()}}LocalDataSource with Loggable implements {{name.pascalCase()}}DataSourceInterface
  {{name.pascalCase()}}LocalDataSource(this.localApi);
  final LocalApi localApi;
  
  Future<dynamic> add{{name.pascalCase()}} (BodyParams bodyParams) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> update{{name.pascalCase()}} (UrlAndBodyParams urlAndBodyParams) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> getAll{{name.pascalCase()}}s (NoParams noParams) async {
    final response = <String,dynamic>{};
    return response;
  }
  
  Future<dynamic> get{{name.pascalCase()}}ById (UrlParams urlParams) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> delete{{name.pascalCase()}} (UrlParams urlParams) async {
    final response = <String,dynamic>{};
    return response;
  }
}
