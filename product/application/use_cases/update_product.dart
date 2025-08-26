// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';

class UpdateProduct extends UseCase<Product, UpdateProductParams> {
  UpdateProduct(this._repository);
  final ProductRepository _repository;

  @override
  Future<ApiResponse<Product>> call(UpdateProductParams updateProductParams) =>
      _repository.updateProduct(updateProductParams);
}

class UpdateProductParams extends UrlAndFieldParams {
  UpdateProductParams({
    required String id,
    required String name,
    required String description,
    required String category,
    required double price,
  }) : super(
         urlParams: [id],
         fieldParams: {
           'name': name,
           'description': description,
           'category': category,
           'price': price,
         },
       );
}
