// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/domain/data_sources/product_data_source_interface.dart';
import 'package:urban_transport/services/api/mock_api/mock_api.dart';

class ProductMockDataSource
    with Loggable
    implements ProductDataSourceInterface {
  ProductMockDataSource({
    required this.mockApi,
  });
  final MockApi mockApi;

  @override
  Future<dynamic> addProduct(FieldParams fieldParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> updateProduct(UrlAndFieldParams urlAndFieldParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> getAllProducts(NoParams noParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> getProductById(UrlParams urlParams) async {
    final response = <String, dynamic>{};
    return response;
  }

  @override
  Future<dynamic> deleteProduct(UrlParams urlParams) async {
    final response = <String, dynamic>{};
    return response;
  }
}
