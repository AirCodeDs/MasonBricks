// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:app_services/app_services.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/mappers/{{name.snakeCase()}}_mapper.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class Base{{name.pascalCase()}}SyncDataSource
    with Loggable, ApiResponseHandlerMixin
    implements {{name.pascalCase()}}SyncDataSource {
  Base{{name.pascalCase()}}SyncDataSource({required this.syncApiClient});
  final SyncApiClient<String, dynamic> syncApiClient;

  static const String productBoxKey = '{{name.snakeCase()}}s';

  @override
  Future<ApiResponse<Page<List<{{name.snakeCase()}}>>>> GetAll{{name.pascalCase()}}s(
    NoParams noParams,
  ) async {
    final response = await syncApiClient.request(
      path: productBoxKey,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<{{name.snakeCase()}}>>>(
      response: response,
      onSuccess: (rawData) {
        final list = TypeConvertor().convertUnknownToListOfMaps(rawData);
        final models = list.map({{name.pascalCase()}}Model.fromJson).toList();
        final entities = const {{name.pascalCase()}}Mapper().toEntityList(models);

        return Page<List<{{name.snakeCase()}}>>(
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
  Future<ApiResponse<void>> Sync{{name.pascalCase()}}s(List<{{name.snakeCase()}}> {{name.snakeCase()}}s) async {
    final {{name.pascalCase()}}Models = const {{name.pascalCase()}}Mapper().toModelList({{name.snakeCase()}}s);
    final productsAsList = {{name.pascalCase()}}Models.map((el) => el.toJson()).toList();
    try {
      await syncApiClient.request(
        path: productBoxKey,
        requestType: RequestType.post,
        body: {'data': productsAsList},
        isListMap: true,
        addAll: true,
      );
      return SuccessApiResponse(null);
    } catch (e) {
      return UnknownHttpException('Failed to add all {{name.snakeCase()}} locally: $e');
    }
  }
}
