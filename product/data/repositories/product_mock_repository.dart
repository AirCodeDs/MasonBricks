// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:urban_transport/features/product/data/data_sources/product_mock_data_source.dart';
import 'package:urban_transport/features/product/data/repositories/base_product_repository/base_product_core_repository.dart';

class ProductMockRepository extends BaseProductCoreRepository {
  ProductMockRepository({
    required ProductMockDataSource mockDataSource,
  }) : super(mockDataSource);
}
