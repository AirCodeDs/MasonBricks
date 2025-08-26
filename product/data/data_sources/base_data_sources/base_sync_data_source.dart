// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:app_services/app_services.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/contracts/product_data_source.dart';
import 'package:hbh_connect/features/product/data/mappers/product_mapper.dart';
import 'package:hbh_connect/features/product/data/models/product_model.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';

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
  Future<ApiResponse<void>> syncProducts(List<Product> products) async {
    final productModels = const ProductMapper().toModelList(products);
    final productsAsList = productModels.map((el) => el.toJson()).toList();
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
      return UnknownHttpException('Failed to add all product locally: $e');
    }
  }
}
