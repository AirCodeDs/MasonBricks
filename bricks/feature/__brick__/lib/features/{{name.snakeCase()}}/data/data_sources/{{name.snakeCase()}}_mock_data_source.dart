
import 'package:{{project_name}}/config/logs/app_log.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/services/api/mock_api/mock_api.dart'; 
import 'package:{{project_name}}/features/{{name}}/data/data_sources/{{name.snakeCase()}}_data_source_interface.dart';

class {{name.pascalCase()}}MockDataSource with Loggable implements {{name.pascalCase()}}DataSourceInterface
  {{name.pascalCase()}}MockDataSource(this.mockApi); 
  final MockApi mockApi;

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
