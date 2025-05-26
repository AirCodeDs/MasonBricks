// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/constants/error_text_string.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/core/utils/type_convertor/type_convertor.dart';
import 'package:/features/product/data/data_sources/remote/product_remote_data_source.dart';
import 'package:/features/product/data/models/product_model.dart';
import 'package:/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.remoteDataSource, /* this.localDataSource */); // Décommenter localDataSource si utilisé
  final ProductRemoteDataSource remoteDataSource;
  // final ProductLocalDataSource localDataSource; // Décommenter si tu as une source de données locale

  @override
  Future<Either<Failure, ApiResponse>> addProduct(
    TemplateParams templateParams,
  ) async {
    try {
      final response = await remoteDataSource.addProduct(
        templateParams,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> deleteProduct(ParamOne paramOne) async {
    try {
      final response = await remoteDataSource.deleteProduct(
        paramOne,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>> getAllProducts(
    NoParams noParams,
  ) async {
    try {
      final response = await remoteDataSource.getAllProducts(
        noParams,
      );
      if (response['success'] == true) {
        final products = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map(ProductModel.fromMap)
            .toList();
        final productsWithPagination =
            PaginationDataModel.fromMap(response['data']['pagination'], products);

        return Right(productsWithPagination);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(
    ParamOne paramOne,
  ) async {
    try {
      final response = await remoteDataSource.getProductById(
        paramOne,
      );

      if (response['success'] == true) {
        final product = ProductModel.fromMap(response['data']);
        return Right(product);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> updateProduct(
    TemplateParams templateParams,
  ) async {
    try {
      final response = await remoteDataSource.updateProduct(
        templateParams,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }
}
