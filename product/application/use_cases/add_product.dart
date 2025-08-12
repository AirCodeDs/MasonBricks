// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/interfaces/use_case.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

class AddProduct implements UseCase<Product, AddProductParams> {
  AddProduct(this._repository);
  final ProductRepository _repository;

  @override
  Future<ApiResponse<Product>> call(
    AddProductParams addProductParams,
  ) =>
      _repository.addProduct(addProductParams);
}

class AddProductParams extends FieldParams {
  AddProductParams({
    required String name,
    required String description,
    required String category,
    required double price,
  }) : super(
          fieldParams: {
            'name': name,
            'description': description,
            'category': category,
            'price': price,
          },
        );
}

// class AddProductParams extends FieldParams {
//   AddProductParams({
//     required String fieldParam1,
//     required String fieldParam2,
//     String? fieldParam3,
//   }) : super(
//           fieldParams: {
//             'fieldParam1': fieldParam1,
//             'fieldParam2': fieldParam2,
//             if (fieldParam3 != null) 'fieldParam3': fieldParam3,
//           },
//         );
// }
