// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';

import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart'; // Pour le type de retour

class GetAllProducts
    implements UseCase<PaginationDataModel<List<Product>>, NoParams> {
  GetAllProducts(this._repository);
  final ProductDataReader _repository;

  @override
  Future<ApiResponse<PaginationDataModel<List<Product>>>> call(
    NoParams noParams,
  ) => _repository.getAllProducts(noParams);
}

class GetAllProductParams extends NoParams {
  GetAllProductParams({super.paginationPageIndex});
}
