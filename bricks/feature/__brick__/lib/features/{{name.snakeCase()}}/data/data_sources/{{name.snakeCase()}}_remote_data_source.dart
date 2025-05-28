// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/constants/api_url/api_url.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/domain/data_sources/product_data_source_interface.dart';
import 'package:urban_transport/services/api/remote_api/abstract/api_client.dart';

class ProductRemoteDataSource
    with Loggable
    implements ProductDataSourceInterface {
  ProductRemoteDataSource({
    required this.apiClient,
  });
  final ApiClient apiClient;

  @override
  Future<dynamic> addProduct(FieldParams fieldParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.post,
      body: fieldParams.fieldParams,
    );
    return response;
  }

  @override
  Future<dynamic> updateProduct(UrlAndFieldParams urlAndFieldParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.post,
      body: urlAndFieldParams.fieldParams,
    );
    return response;
  }

  @override
  Future<dynamic> getAllProducts(NoParams noParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.get,
    );
    return response;
  }

  @override
  Future<dynamic> getProductById(UrlParams urlParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.get,
    );
    return response;
  }

  @override
  Future<dynamic> deleteProduct(UrlParams urlParams) async {
    final response = await apiClient.init(
      path: ApiUrl.dev,
      requestType: RequestType.delete,
    );
    return response;
  }
}
