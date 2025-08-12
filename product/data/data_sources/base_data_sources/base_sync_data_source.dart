import 'package:urban_transport/core/logging/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/api_response/api_response_util/api_response_handler.dart';
import 'package:urban_transport/core/constants/request_type/request_type.dart';
import 'package:urban_transport/core/converters/type_convertor.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/data/mappers/product_mapper.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/services/api_client/sync_api_client/sync_api_client.dart';

class BaseProductSyncDataSource
    with Loggable, ApiResponseHandlerMixin
    implements ProductSyncDataSource {
  BaseProductSyncDataSource({required this.syncApiClient});
  final SyncApiClient<String, dynamic> syncApiClient;

  static const String productBoxKey = 'products';

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async {
    final response = await syncApiClient.request(
      path: productBoxKey,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<Product>>>(
      response: response,
      onSuccess: (rawData) {
        final list = TypeConvertor().convertUnknownToListOfMaps(rawData);
        final models = list.map(ProductModel.fromJson).toList();
        final entities = const ProductMapper().toEntityList(models);

        return PaginationDataModel<List<Product>>(
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
  Future<ApiResponse<void>> syncProducts(
    List<Product> products,
  ) async {
    final productModels = const ProductMapper().toModelList(products);
    final productsAsList = productModels.map((el) => el.toJson()).toList();
    try {
      await syncApiClient.request(
        path: productBoxKey,
        requestType: RequestType.post,
        body: {
          'data': productsAsList,
        },
        isListMap: true,
        addAll: true,
      );
      return SuccessApiResponse(null);
    } catch (e) {
      return UnknownHttpException('Failed to add all product locally: $e');
    }
  }
}
