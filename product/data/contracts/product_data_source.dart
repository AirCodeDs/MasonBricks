// ignore_for_file: one_member_abstracts

import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';

abstract class ProductReaderDataSource {
  Future<ApiResponse<Page<List<Product>>>> getAllProducts(
    NoParams noParams,
  );
}

abstract class ProductSyncDataSource extends ProductReaderDataSource {
  Future<ApiResponse<void>> syncProducts(
    List<Product> products,
  );
}

abstract class ProductCoreDataSource extends ProductReaderDataSource {
  Future<ApiResponse<Product>> addProduct(FieldParams fieldParams);
  Future<ApiResponse<Product>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  );
  Future<ApiResponse<Product>> getProductById(UrlParams urlParams);
  Future<ApiResponse<void>> deleteProduct(UrlParams urlParams);
}
