// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/contracts/product_data_source.dart';
import 'package:hbh_connect/features/product/data/repositories/base_product_repository/base_product_data_reader_repository.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductCoreRepository extends BaseProductDataReaderRepository
    with Loggable
    implements ProductRepository {
  BaseProductCoreRepository(this._dataSource) : super(_dataSource);

  final ProductCoreDataSource _dataSource;
  @override
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams) async {
    final response = await _dataSource.addProduct(fieldParams);
    return response;
  }

  @override
  Future<ApiResponse<void>> deleteProduct(UrlParams urlParams) async =>
      _dataSource.deleteProduct(urlParams);

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async => _dataSource.getAllProducts(noParams);

  @override
  Future<ApiResponse<Product>> getProductById(UrlParams urlParams) async =>
      _dataSource.getProductById(urlParams);

  @override
  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  ) async => _dataSource.updateProduct(urlAndFieldParams);
}
