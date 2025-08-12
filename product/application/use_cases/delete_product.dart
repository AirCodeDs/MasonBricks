// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/interfaces/use_case.dart';

import 'package:urban_transport/features/product/domain/repositories/product_repository.dart'; // Assure-toi que le chemin est correct

class DeleteProduct implements UseCase<void, DeleteProductParams> {
  DeleteProduct(this._repository);
  final ProductRepository _repository;

  @override
  Future<ApiResponse<void>> call(
    DeleteProductParams deleteProductParams,
  ) =>
      _repository.deleteProduct(deleteProductParams);
}

class DeleteProductParams extends UrlParams {
  DeleteProductParams({
    required String id,
  }) : super(
          urlParams: [
            id,
          ].whereType<String>().toList(),
        );
}
