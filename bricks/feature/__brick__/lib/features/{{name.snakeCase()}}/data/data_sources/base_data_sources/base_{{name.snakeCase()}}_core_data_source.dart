// Project imports:

import 'package:{{project_name}}/core/logging/app_log.dart';
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/api_response/api_response_util/api_response_handler.dart';
import 'package:{{project_name}}/core/constants/api_url/api_url.dart';
import 'package:{{project_name}}/core/constants/request_type/request_type.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/core/converters/type_convertor.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/mappers/{{name.snakeCase()}}_mapper.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name}}/core/interfaces/api_client.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class Base{{name.pascalCase()}}CoreDataSource
    with Loggable, ApiResponseHandlerMixin
    implements {{name.pascalCase()}}CoreDataSource {
  Base{{name.pascalCase()}}CoreDataSource({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.camelCase()}}.base,
      requestType: RequestType.post,
      body: fieldParams.fieldParams,
    );

    return handleApiResponse<{{name.pascalCase()}}>(
      response: response,
      onSuccess: (raw) => const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.camelCase()}}.byId(urlAndFieldParams.urlParams.first),
      requestType: RequestType.put,
      body: urlAndFieldParams.fieldParams,
    );

    return handleApiResponse<{{name.pascalCase()}}>(
      response: response,
      onSuccess: (raw) => const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.camelCase()}}.base,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<{{name.pascalCase()}}>>>(
      response: response,
      onSuccess: (rawData) {
        final map = TypeConvertor().convertToMapStringDynamic(rawData);
        final models = TypeConvertor()
            .convertUnknownToListOfMaps(map['data'])
            .map({{name.pascalCase()}}Model.fromJson)
            .toList();
        final items = const {{name.pascalCase()}}Mapper().toEntityList(models);
        final meta = TypeConvertor().convertToMapStringDynamic(map['pagination']);
        return PaginationDataModel<List<{{name.pascalCase()}}>>.fromJson(meta, items);
      },
    );
  }

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(
    UrlParams urlParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.camelCase()}}.byId(urlParams.params.first),
      requestType: RequestType.get,
    );

    return handleApiResponse<{{name.pascalCase()}}>(
      response: response,
      onSuccess: (raw) => const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<void>> delete{{name.pascalCase()}}(UrlParams urlParams) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.camelCase()}}.byId(urlParams.params.first),
      requestType: RequestType.delete,
    );

    return handleApiResponse<void>(
      response: response,
      onSuccess: (_) {},
    );
  }
}


