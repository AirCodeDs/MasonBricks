
import 'package:{{project_name}}/config/logs/app_log.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/services/api/mock_api/mock_api.dart'; 

class {{name.pascalCase()}}MockDataSource with Loggable {
  {{name.pascalCase()}}MockDataSource(this.mockApi); 
  final MockApi mockApi;

  Future<dynamic> add{{name.pascalCase()}}(TemplateParams templateParams) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> update{{name.pascalCase()}}(TemplateParams templateParams) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> getAll{{name.pascalCase()}}s(NoParams noParams) async {
    final response = <String,dynamic>{};
    return response;
  }
  
  Future<dynamic> get{{name.pascalCase()}}ById(ParamOne paramOne) async {
    final response = <String,dynamic>{};
    return response;
  }

  Future<dynamic> delete{{name.pascalCase()}}(ParamOne paramOne) async {
    final response = <String,dynamic>{};
    return response;
  }
}
