// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/{{name.snakeCase()}}/domain/data_sources/{{name.snakeCase()}}_data_source_interface.dart';
import 'package:urban_transport/services/api/local_api/local_api.dart';

class {{name.pascalCase()}}LocalDataSource
    with Loggable
    implements {{name.pascalCase()}}DataSourceInterface {
  {{name.pascalCase()}}LocalDataSource({required this.localApi});
  final LocalApi localApi;

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
