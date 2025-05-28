// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/utils/type_convertor/type_convertor.dart';
import 'package:urban_transport/features/product/data/data_sources/product_local_data_source.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart';

class ProductLocalRepositoryImpl
    with Loggable
    implements ProductRepositoryInterface {
  ProductLocalRepositoryImpl({required this.localDataSource});

  final ProductLocalDataSource localDataSource;

  @override
  Future<Either<Failure, ProductModel>> addProduct(
    FieldParams fieldParams,
  ) async {
    try {
      final response = await localDataSource.addProduct(fieldParams);

      if (response['success'] == true) {
        return Right(ProductModel.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> deleteProduct(
    UrlParams urlParams,
  ) async {
    try {
      final response = await localDataSource.deleteProduct(urlParams);

      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>>
  getAllProducts(NoParams noParams) async {
    try {
      final response = await localDataSource.getAllProducts(noParams);

      if (response['success'] == true) {
        final products = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map(ProductModel.fromJson)
            .toList();
        final productsWithPagination = PaginationDataModel.fromJson(
          response['data']['pagination'],
          products,
        );

        return Right(productsWithPagination);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(
    UrlParams urlParams,
  ) async {
    try {
      final response = await localDataSource.getProductById(urlParams);

      if (response['success'] == true) {
        return Right(ProductModel.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(
    UrlAndFieldParams urlAndFieldParams,
  ) async {
    try {
      final response = await localDataSource.updateProduct(urlAndFieldParams);

      if (response['success'] == true) {
        return Right(ProductModel.fromJson(response['data']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      return Left(UnexpectedFailure.withLog(e.toString()));
    }
  }
}
