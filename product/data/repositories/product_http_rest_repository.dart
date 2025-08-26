// ignore_for_file: avoid_dynamic_calls

// Project imports:
import 'package:hbh_connect/features/product/data/data_sources/product_http_rest_data_source.dart';
import 'package:hbh_connect/features/product/data/repositories/base_product_repository/base_product_core_repository.dart';

//
class ProductHttpRestRepository extends BaseProductCoreRepository {
  ProductHttpRestRepository({
    required ProductHttpRestDataSource httpRestDataSource,
  }) : super(httpRestDataSource);
}
