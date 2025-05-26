// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/use_cases/use_case.dart';
import 'package:/core/utils/models/pagination_data_model.dart'; // Pour le type de retour
import 'package:/features/product/data/models/product_model.dart'; // Pour le type de retour
import 'package:/features/product/data/repositories/product_repository_impl.dart'; // Assure-toi que le chemin est correct

class GetAllProducts implements UseCase<PaginationDataModel<List<ProductModel>>, NoParams> {
  GetAllProducts(this.productRepositoryImpl);
  final ProductRepositoryImpl productRepositoryImpl;

  @override
  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>> call(
    NoParams noParams,
  ) =>
      productRepositoryImpl.getAllProducts(noParams);
}