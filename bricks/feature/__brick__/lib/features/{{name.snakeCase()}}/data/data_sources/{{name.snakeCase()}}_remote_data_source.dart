// Project imports:
import 'package:{{name.snakeCase()}}/config/logs/app_log.dart';
import 'package:{{name.snakeCase()}}/core/constants/api_url/api_url.dart';
import 'package:{{name.snakeCase()}}/core/params/params.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/data_sources/{{name.snakeCase()}}_data_source_interface.dart';
import 'package:{{name.snakeCase()}}/services/api_client/remote_api_client/abstract/api_client.dart';

class {{name.pascalCase()}}RemoteDataSource
    with Loggable
    implements {{name.pascalCase()}}DataSourceInterface {
  {{name.pascalCase()}}RemoteDataSource({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<dynamic> add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.post,
      body: fieldParams.fieldParams,
    );
    return response;
  }

  @override
  Future<dynamic> update{{name.pascalCase()}}(UrlAndFieldParams urlAndFieldParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.post,
      body: urlAndFieldParams.fieldParams,
    );
    return response;
  }

  @override
  Future<dynamic> getAll{{name.pascalCase()}}s(NoParams noParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.get,
    );
    return response;
  }

  @override
  Future<dynamic> get{{name.pascalCase()}}ById(UrlParams urlParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.get,
    );
    return response;
  }

  @override
  Future<dynamic> delete{{name.pascalCase()}}(UrlParams urlParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.delete,
    );
    return response;
  }
}
