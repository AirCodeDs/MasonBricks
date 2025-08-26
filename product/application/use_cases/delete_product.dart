// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart'; // Assure-toi que le chemin est correct

class DeleteProduct implements UseCase<void, DeleteProductParams> {
  DeleteProduct(this._repository);
  final ProductRepository _repository;

  @override
  Future<ApiResponse<void>> call(DeleteProductParams deleteProductParams) =>
      _repository.deleteProduct(deleteProductParams);
}

class DeleteProductParams extends UrlParams {
  DeleteProductParams({required String id})
    : super(urlParams: [id].whereType<String>().toList());
}
