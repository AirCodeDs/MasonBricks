// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';

import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart'; // Assure-toi que le chemin est correct

class DeleteProduct implements UseCase<ApiResponse, DeleteProductParams> {
  DeleteProduct(this._repository);
  final ProductRepositoryInterface _repository;

  @override
  Future<Either<Failure, ApiResponse>> call(
    DeleteProductParams deleteProductParams,
  ) => _repository.deleteProduct(deleteProductParams);
}

class DeleteProductParams extends UrlParams {
  DeleteProductParams({
    required String urlParam1,
    required String urlParam2,
    String? urlParam3,
  }) : super(
         urlParams: [
           urlParam1,
           urlParam2,
           urlParam3,
         ].whereType<String>().toList(),
       );
}
