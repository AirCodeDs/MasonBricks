// sync_product_repository.dart
// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/contracts/product_data_source.dart';
import 'package:hbh_connect/features/product/data/repositories/base_product_repository/base_product_data_reader_repository.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductSyncRepository extends BaseProductDataReaderRepository
    implements ProductSyncRepository {
  BaseProductSyncRepository(this._dataSource) : super(_dataSource);
  final ProductSyncDataSource _dataSource;

  @override
  Future<ApiResponse<void>> syncProducts(List<Product> products) async =>
      _dataSource.syncProducts(products);
}
