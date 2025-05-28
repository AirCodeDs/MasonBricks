// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';

import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart'; // Pour le type de retour
import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart'; // Pour le type de retour

class GetAllProducts
    implements UseCase<PaginationDataModel<List<ProductModel>>, NoParams> {
  GetAllProducts(this._repository);
  final ProductRepositoryInterface _repository;

  @override
  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>> call(
    NoParams noParams,
  ) => _repository.getAllProducts(noParams);
}

class GetAllProductParams extends NoParams {
  GetAllProductParams({super.paginationPageIndex});
}
