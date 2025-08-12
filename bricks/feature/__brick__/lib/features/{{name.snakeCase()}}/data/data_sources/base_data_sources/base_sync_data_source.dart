import 'package:{{project_name}}/core/logging/app_log.dart';
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/api_response/api_response_util/api_response_handler.dart';
import 'package:{{project_name}}/core/constants/request_type/request_type.dart';
import 'package:{{project_name}}/core/converters/type_convertor.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/mappers/{{name.snakeCase()}}_mapper.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/services/api_client/sync_api_client/sync_api_client.dart';

class Base{{name.pascalCase()}}SyncDataSource
    with Loggable, ApiResponseHandlerMixin
    implements {{name.pascalCase()}}SyncDataSource {
  Base{{name.pascalCase()}}SyncDataSource({required this.syncApiClient});
  final SyncApiClient<String, dynamic> syncApiClient;

  static const String boxKey = '{{name.snakeCase()}}s';

  @override
  Future<ApiResponse<Page<List<{{name.pascalCase()}}>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async {
    final response = await syncApiClient.request(
      path: boxKey,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<{{name.pascalCase()}}>>>(
      response: response,
      onSuccess: (rawData) {
        final list = TypeConvertor().convertUnknownToListOfMaps(rawData);
        final models = list.map({{name.pascalCase()}}Model.fromJson).toList();
        final entities = const {{name.pascalCase()}}Mapper().toEntityList(models);

        return PaginationDataModel<List<{{name.pascalCase()}}>>(
          totalCount: entities.length,
          currentPage: 1,
          perPage: entities.length,
          lastPage: 1,
          child: entities,
        );
      },
    );
  }

  @override
  Future<ApiResponse<void>> sync{{name.pascalCase()}}s(
    List<{{name.pascalCase()}}> items,
  ) async {
    final models = const {{name.pascalCase()}}Mapper().toModelList(items);
    final itemsAsList = models.map((el) => el.toJson()).toList();
    try {
      await syncApiClient.request(
        path: boxKey,
        requestType: RequestType.post,
        body: {
          'data': itemsAsList,
        },
        isListMap: true,
        addAll: true,
      );
      return SuccessApiResponse(null);
    } catch (e) {
      return UnknownHttpException('Failed to add all {{name.snakeCase()}} locally: $e');
    }
  }
}


