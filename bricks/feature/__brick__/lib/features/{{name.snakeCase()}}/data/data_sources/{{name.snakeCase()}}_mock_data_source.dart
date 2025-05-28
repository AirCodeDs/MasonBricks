// Project imports:
import 'package:{{name.snakeCase()}}/config/logs/app_log.dart';
import 'package:{{name.snakeCase()}}/core/params/params.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/data_sources/{{name.snakeCase()}}_data_source_interface.dart';
import 'package:{{name.snakeCase()}}/services/api_client/mock_api_client/mock_api_client.dart';

class {{name.pascalCase()}}MockDataSource
    with Loggable
    implements {{name.pascalCase()}}DataSourceInterface {
  {{name.pascalCase()}}MockDataSource({required this.mockApiClient});
  final MockApiClient mockApiClient;

  @override
  Future<dynamic> add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> update{{name.pascalCase()}}(UrlAndFieldParams urlAndFieldParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> getAll{{name.pascalCase()}}s(NoParams noParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> get{{name.pascalCase()}}ById(UrlParams urlParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> delete{{name.pascalCase()}}(UrlParams urlParams) async {
    final response = <String, dynamic>{};
    return response;
  }
}
