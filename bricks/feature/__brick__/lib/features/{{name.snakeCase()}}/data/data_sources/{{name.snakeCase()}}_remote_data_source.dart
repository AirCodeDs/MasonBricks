// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/constants/api_url/api_url.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/data_sources/{{name.snake_case()}}_data_source_interface.dart';
import 'package:urban_transport/services/api/remote_api/abstract/api_client.dart';

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
