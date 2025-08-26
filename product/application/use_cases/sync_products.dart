// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';

class SyncProducts extends UseCase<void, SyncProductsParams> {
  SyncProducts(this._repository);
  final ProductSyncRepository _repository;

  @override
  Future<ApiResponse<void>> call(SyncProductsParams syncProductsParams) =>
      _repository.syncProducts(syncProductsParams.products);
}

class SyncProductsParams extends SyncParams<Product> {
  SyncProductsParams({required this.products}) : super(params: products);
  final List<Product> products;
}
