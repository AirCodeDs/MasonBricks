import 'package:app_core_kit/app_core_kit.dart';
import 'package:app_services/app_services.dart';
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


