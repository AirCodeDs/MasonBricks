
import 'package:{{project_name}}/config/logs/app_log.dart';
import 'package:urban_transport/core/constants/api_url/api_url.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/services/api/remote_api/abstract/api_client.dart';

class {{name.pascalCase()}}RemoteDataSource with Loggable {
  {{name.pascalCase()}}RemoteDataSource(this.apiClient); 
  final ApiClient apiClient; 

  Future<dynamic> add{{name.pascalCase()}} (BodyParams bodyParams) async {
    final response = await apiClient.init( 
      path: ApiUrl.dev, 
      requestType: RequestType.post,
      body: bodyParams.params,
    );
    return response;
  }

  Future<dynamic> update{{name.pascalCase()}} (UrlAndBodyParams urlAndBodyParams) async {
    final response = await apiClient.init( 
      path: ApiUrl.dev, 
      requestType: RequestType.post,
      body: urlAndBodyParams.params,
    );
    return response;
  }

  Future<dynamic> getAll{{name.pascalCase()}}s (NoParams noParams) async {
    final response = await apiClient.init( 
      path: ApiUrl.dev, 
      requestType: RequestType.get,
    );
    return response;
  }
  
  Future<dynamic> get{{name.pascalCase()}}ById (UrlParam urlParam) async {
    final response = await apiClient.init( 
      path: ApiUrl.dev, 
      requestType: RequestType.get,
    );
    return response;
  }

  Future<dynamic> delete{{name.pascalCase()}} (UrlParam urlParam) async {
    final response = await apiClient.init( 
      path: ApiUrl.dev, 
      requestType: RequestType.delete,
    ); 
    return response;
  }
}
