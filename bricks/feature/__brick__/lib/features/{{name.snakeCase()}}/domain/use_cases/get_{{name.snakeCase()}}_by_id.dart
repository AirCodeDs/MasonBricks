// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';

import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart'; // Pour le type de retour

class GetProductById extends UseCase<ProductModel, GetProductByIdParams> {
  GetProductById(this._repository);
  final ProductRepositoryInterface _repository;

  @override
  Future<Either<Failure, ProductModel>> call(
    GetProductByIdParams getProductByIdParams,
  ) => _repository.getProductById(getProductByIdParams);
}

class GetProductByIdParams extends UrlParams {
  GetProductByIdParams({
    required String urlParam1,
    required String urlParam2,
    String? urlParam3,
    //  int? paginationPageIndex,
  }) : super(
         urlParams: [
           urlParam1,
           urlParam2,
           urlParam3,
         ].whereType<String>().toList(),
         // paginationPageIndex: paginationPageIndex,
       );
}
