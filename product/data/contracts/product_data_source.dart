// ignore_for_file: one_member_abstracts

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';

abstract class ProductReaderDataSource {
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(NoParams noParams);
}

abstract class ProductSyncDataSource extends ProductReaderDataSource {
  Future<ApiResponse<void>> syncProducts(List<Product> products);
}

abstract class ProductCoreDataSource extends ProductReaderDataSource {
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams);
  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  );
  Future<ApiResponse<Product>> getProductById(UrlParams urlParams);
  Future<ApiResponse<void>> deleteProduct(UrlParams urlParams);
}
