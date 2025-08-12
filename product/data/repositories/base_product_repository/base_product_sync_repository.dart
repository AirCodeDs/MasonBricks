// sync_product_repository.dart
// ignore_for_file: avoid_dynamic_calls

import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/features/product/data/repositories/base_product_repository/base_product_data_reader_repository.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductSyncRepository extends BaseProductDataReaderRepository
    implements ProductSyncRepository {
  BaseProductSyncRepository(
    this._dataSource,
  ) : super(_dataSource);
  final ProductSyncDataSource _dataSource;

  @override
  Future<ApiResponse<void>> syncProducts(
    List<Product> products,
  ) async =>
      _dataSource.syncProducts(products);
}
