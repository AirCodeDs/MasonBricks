import 'package:urban_transport/features/product/data/repositories/base_product_repository/base_product_sync_repository.dart';
import 'package:urban_transport/features/product/data/contracts/product_data_source.dart';

class ProductSyncRepository extends BaseProductSyncRepository {
  ProductSyncRepository({
    required ProductSyncDataSource syncDataSource,
  }) : super(syncDataSource);
}
