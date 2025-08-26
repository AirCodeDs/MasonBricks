// Project imports:

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';

// ignore: one_member_abstracts
abstract class ProductDataReader {
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(NoParams noParams);
}

/// Synchronization repository for bulk domain sync operations.
abstract class ProductSyncRepository extends ProductDataReader {
  Future<ApiResponse<void>> syncProducts(List<Product> products);
}

abstract class ProductRepository extends ProductDataReader {
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams);

  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  );

  Future<ApiResponse<void>> deleteProduct(UrlParams urlParams);

  @override
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(NoParams noParams);

  Future<ApiResponse<Product>> getProductById(UrlParams urlParams);
}
