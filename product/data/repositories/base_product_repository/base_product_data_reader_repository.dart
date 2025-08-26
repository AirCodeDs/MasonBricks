// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/contracts/product_data_source.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductDataReaderRepository
    with Loggable
    implements ProductDataReader {
  BaseProductDataReaderRepository(this._dataSource);
  final ProductReaderDataSource _dataSource;

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async => _dataSource.getAllProducts(noParams);
}
