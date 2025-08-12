import 'package:urban_transport/core/api_response/api_response.dart';

// Project imports:
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/interfaces/use_case.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

class SyncProducts extends UseCase<void, SyncProductsParams> {
  SyncProducts(this._repository);
  final ProductSyncRepository _repository;

  @override
  Future<ApiResponse<void>> call(
    SyncProductsParams syncProductsParams,
  ) =>
      _repository.syncProducts(syncProductsParams.products);
}

class SyncProductsParams extends SyncParams<Product> {
  SyncProductsParams({
    required this.products,
  }) : super(params: products);
  final List<Product> products;
}
