// Project imports:

import 'package:urban_transport/core/logging/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/api_response/api_response_util/api_response_handler.dart';
import 'package:urban_transport/core/constants/api_url/api_url.dart';
import 'package:urban_transport/core/constants/request_type/request_type.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/converters/type_convertor.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/data/mappers/product_mapper.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';
import 'package:urban_transport/core/interfaces/api_client.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';

class BaseProductCoreDataSource
    with Loggable, ApiResponseHandlerMixin
    implements ProductCoreDataSource {
  BaseProductCoreDataSource({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams) async {
    final response = await apiClient.request(
      path: ApiUrl.product.base,
      requestType: RequestType.post,
      body: fieldParams.fieldParams,
    );

    return handleApiResponse<Product>(
      response: response,
      onSuccess: (raw) =>
          const ProductMapper().toEntity(ProductModel.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.product.byId(urlAndFieldParams.urlParams.first),
      requestType: RequestType.put,
      body: urlAndFieldParams.fieldParams,
    );

    return handleApiResponse<Product>(
      response: response,
      onSuccess: (raw) =>
          const ProductMapper().toEntity(ProductModel.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.product.base,
      requestType: RequestType.get,
    );

    return handleApiResponse<Page<List<Product>>>(
      response: response,
      onSuccess: (rawData) {
        final map = TypeConvertor().convertToMapStringDynamic(rawData);
        final models = TypeConvertor()
            .convertUnknownToListOfMaps(map['data'])
            .map(ProductModel.fromJson)
            .toList();
        final items = const ProductMapper().toEntityList(models);
        final meta =
            TypeConvertor().convertToMapStringDynamic(map['pagination']);
        return PaginationDataModel<List<Product>>.fromJson(meta, items);
      },
    );
  }

  @override
  Future<ApiResponse<Product>> getProductById(
    UrlParams urlParams,
  ) async {
    final response = await apiClient.request(
      path: ApiUrl.product.byId(urlParams.params.first),
      requestType: RequestType.get,
    );

    return handleApiResponse<Product>(
      response: response,
      onSuccess: (raw) =>
          const ProductMapper().toEntity(ProductModel.fromJson(raw)),
    );
  }

  @override
  Future<ApiResponse<void>> deleteProduct(UrlParams urlParams) async {
    final response = await apiClient.request(
      path: ApiUrl.product.byId(urlParams.params.first),
      requestType: RequestType.delete,
    );

    return handleApiResponse<void>(
      response: response,
      onSuccess: (_) {},
    );
  }
}
