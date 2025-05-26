
import 'package:{{project_name}}/config/logs/app_log.dart';
import 'package:{{project_name}}/core/constants/api_url/api_url.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/services/api/api_client/api_client.dart'; 

class {{name.pascalCase()}}RemoteDataSource with Loggable {
  {{name.pascalCase()}}RemoteDataSource(this.apiClient); 
  final ApiClient apiClient; 

  Future<dynamic> add{{name.pascalCase()}}(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> update{{name.pascalCase()}}(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> getAll{{name.pascalCase()}}s(NoParams noParams) async {
    final response = await apiClient.init( 
      path:'',
      requestType: RequestType.get,
    );
    return response;
  }
  
  dynamic> get{{name.pascalCase()}}ById(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.get,
    );
    return response;
  }

  Future<dynamic> delete{{name.pascalCase()}}(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.delete,
    );
    return response;
  }
}