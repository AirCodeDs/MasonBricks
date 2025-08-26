// Project imports:

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:app_services/app_services.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/core/constants/api_url/api_url.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/mappers/{{name.snakeCase()}}_mapper.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class Base{{name.pascalCase()}}CoreDataSource
    with Loggable, ApiResponseHandlerMixin
    implements {{name.pascalCase()}}CoreDataSource {
  Base{{name.pascalCase()}}CoreDataSource({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Add{{name.pascalCase()}}(FieldParams fieldParams) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.snakeCase()}}.base,
      requestType: RequestType.post,
      body: fieldParams.fieldParams,
    );

    return handleApiResponse<{{name.snakeCase()}}>(
      response: response,
      onSuccess: (raw) =>
          const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Update{{name.pascalCase()}}(
    UrlAndFieldParams urlAndFieldParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.snakeCase()}}.byId(urlAndFieldParams.urlParams.first),
      requestType: RequestType.put,
      body: urlAndFieldParams.fieldParams,
    );

    return handleApiResponse<{{name.snakeCase()}}>(
      response: response,
      onSuccess: (raw) =>
          const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.snakeCase()}}.base,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<{{name.snakeCase()}}>>>(
      response: response,
      onSuccess: (rawData) {
        final map = TypeConvertor().convertToMapStringDynamic(rawData);
        final models = TypeConvertor()
            .convertUnknownToListOfMaps(map['data'])
            .map({{name.pascalCase()}}Model.fromJson)
            .toList();
        final items = const {{name.pascalCase()}}Mapper().toEntityList(models);
        final meta = TypeConvertor().convertToMapStringDynamic(
          map['pagination'],
        );
        return Page<List<{{name.snakeCase()}}>>.fromJson(meta, items);
      },
    );
  }

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> Get{{name.pascalCase()}}ById(UrlParams urlParams) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.snakeCase()}}.byId(urlParams.params.first),
      requestType: RequestType.get,
    );

    return handleApiResponse<{{name.snakeCase()}}>(
      response: response,
      onSuccess: (raw) =>
          const {{name.pascalCase()}}Mapper().toEntity({{name.pascalCase()}}Model.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<void>> Delete{{name.pascalCase()}}(UrlParams urlParams) async {
    final response = await apiClient.request(
      path: ApiUrl.{{name.snakeCase()}}.byId(urlParams.params.first),
      requestType: RequestType.delete,
    );

    return handleApiResponse<void>(response: response, onSuccess: (_) {});
  }
}
