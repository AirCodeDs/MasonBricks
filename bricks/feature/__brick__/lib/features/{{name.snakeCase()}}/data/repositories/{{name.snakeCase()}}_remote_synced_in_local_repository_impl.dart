// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/config/logs/app_log.dart';
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/network/netwok_info.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/utils/type_convertor/type_convertor.dart';
import 'package:urban_transport/features/product/data/data_sources/product_local_data_source.dart';
import 'package:urban_transport/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/domain/data_sources/product_data_source_interface.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart';

class ProductRemoteSyncedInLocalRepositoryImpl
    with Loggable
    implements ProductRepositoryInterface {
  ProductRemoteSyncedInLocalRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  Future<ProductDataSourceInterface> _getDataSource() async {
    if (await networkInfo.isConnected) {
      return remoteDataSource;
    }
    return localDataSource;
  }

  @override
  Future<Either<Failure, ProductModel>> addProduct(
    FieldParams fieldParams,
  ) async {
    try {
      final response = await remoteDataSource.addProduct(fieldParams);

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
      final response = await remoteDataSource.deleteProduct(urlParams);

      if (response['success'] == true) {
        final response = await localDataSource.deleteProduct(urlParams);
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
      final dataSource = await _getDataSource();
      final response = await dataSource.getAllProducts(noParams);

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
      final dataSource = await _getDataSource();
      final response = await dataSource.getProductById(urlParams);

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
      final response = await remoteDataSource.updateProduct(urlAndFieldParams);

      if (response['success'] == true) {
        final response = await localDataSource.updateProduct(urlAndFieldParams);
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
