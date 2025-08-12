import 'package:urban_transport/features/product/Application/use_cases/sync_products.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';

class SyncProductsCommand {
  SyncProductsCommand({
    required this.products,
    required this.syncProducts,
  });

  final List<Product> products;
  final SyncProducts syncProducts;

  Future<void> execute() async {
    await syncProducts.call(SyncProductsParams(products: products));
  }
}
