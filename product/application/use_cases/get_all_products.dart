// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/interfaces/use_case.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart'; // Pour le type de retour
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart'; // Pour le type de retour

class GetAllProducts
    implements UseCase<PaginationDataModel<List<Product>>, NoParams> {
  GetAllProducts(this._repository);
  final ProductDataReader _repository;

  @override
  Future<ApiResponse<PaginationDataModel<List<Product>>>> call(
    NoParams noParams,
  ) =>
      _repository.getAllProducts(noParams);
}

class GetAllProductParams extends NoParams {
  GetAllProductParams({super.paginationPageIndex});
}
