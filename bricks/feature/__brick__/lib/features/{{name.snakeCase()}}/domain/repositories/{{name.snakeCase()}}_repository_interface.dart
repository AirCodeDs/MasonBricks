// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, ProductModel>> addProduct(FieldParams fieldParams);

  Future<Either<Failure, ProductModel>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  );

  Future<Either<Failure, ApiResponse>> deleteProduct(UrlParams urlParams);

  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>>
  getAllProducts(NoParams noParams);

  Future<Either<Failure, ProductModel>> getProductById(UrlParams urlParams);
}
