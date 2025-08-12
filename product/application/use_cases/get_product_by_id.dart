// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/interfaces/use_case.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';

import 'package:urban_transport/features/product/domain/repositories/product_repository.dart'; // Pour le type de retour

class GetProductById extends UseCase<Product, GetProductByIdParams> {
  GetProductById(this._repository);
  final ProductRepository _repository;

  @override
  Future<ApiResponse<Product>> call(
    GetProductByIdParams getProductByIdParams,
  ) =>
      _repository.getProductById(getProductByIdParams);
}

class GetProductByIdParams extends UrlParams {
  GetProductByIdParams({
    required String id,
  }) : super(
          urlParams: [
            id,
          ].whereType<String>().toList(),
          // paginationPageIndex: paginationPageIndex,
        );
}

// class GetProductByIdParams extends UrlParams {
//   GetProductByIdParams({
//     required String urlParam1,
//     required String urlParam2,
//     String? urlParam3,
//     //  int? paginationPageIndex,
//   }) : super(
//           urlParams: [
//             urlParam1,
//             urlParam2,
//             urlParam3,
//           ].whereType<String>().toList(),
//           // paginationPageIndex: paginationPageIndex,
//         );
// }
