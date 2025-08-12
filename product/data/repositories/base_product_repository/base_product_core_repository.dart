import 'dart:async';
import 'package:urban_transport/core/logging/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/product/data/repositories/base_product_repository/base_product_data_reader_repository.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductCoreRepository extends BaseProductDataReaderRepository
    with Loggable
    implements ProductRepository {
  BaseProductCoreRepository(
    this._dataSource,
  ) : super(_dataSource);

  final ProductCoreDataSource _dataSource;
  @override
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams) async {
    final response = await _dataSource.addProduct(fieldParams);
    return response;
  }

  @override
  Future<ApiResponse<void>> deleteProduct(
    UrlParams urlParams,
  ) async =>
      _dataSource.deleteProduct(urlParams);

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async =>
      _dataSource.getAllProducts(noParams);

  @override
  Future<ApiResponse<Product>> getProductById(
    UrlParams urlParams,
  ) async =>
      _dataSource.getProductById(urlParams);

  @override
  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  ) async =>
      _dataSource.updateProduct(urlAndFieldParams);
}
