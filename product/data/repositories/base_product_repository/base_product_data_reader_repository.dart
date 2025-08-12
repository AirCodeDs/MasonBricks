import 'package:urban_transport/core/logging/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

abstract class BaseProductDataReaderRepository
    with Loggable
    implements ProductDataReader {
  BaseProductDataReaderRepository(
    this._dataSource,
  );
  final ProductReaderDataSource _dataSource;

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  ) async =>
      _dataSource.getAllProducts(noParams);
}
