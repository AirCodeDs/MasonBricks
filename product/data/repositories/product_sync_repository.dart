// Project imports:
import 'package:hbh_connect/features/product/data/contracts/product_data_source.dart';
import 'package:hbh_connect/features/product/data/repositories/base_product_repository/base_product_sync_repository.dart';

class ProductSyncRepository extends BaseProductSyncRepository {
  ProductSyncRepository({required ProductSyncDataSource syncDataSource})
    : super(syncDataSource);
}
