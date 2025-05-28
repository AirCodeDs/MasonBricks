// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart';

import 'package:urban_transport/features/product/data/models/product_model.dart'; // Pour le type de retour

class UpdateProduct extends UseCase<ProductModel, UpdateProductParams> {
  UpdateProduct(this._repository);
  final ProductRepositoryInterface _repository;

  @override
  Future<Either<Failure, ProductModel>> call(
    UpdateProductParams updateProductParams,
  ) => _repository.updateProduct(updateProductParams);
}

class UpdateProductParams extends UrlAndFieldParams {
  UpdateProductParams({
    required String fieldParam1,
    required String fieldParam2,
    required String urlParam1,
    String? fieldParam3,
    String? urlParam2,
  }) : super(
         urlParams: [urlParam1, if (urlParam2 != null) urlParam2],
         fieldParams: {
           'fieldParam1': fieldParam1,
           'fieldParam2': fieldParam2,
           if (fieldParam3 != null) 'fieldParam3': fieldParam3,
         },
       );
}
