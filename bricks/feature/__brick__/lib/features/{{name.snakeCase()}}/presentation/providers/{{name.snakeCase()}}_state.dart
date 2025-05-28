// Project imports:
import 'package:urban_transport/features/product/data/models/product_model.dart';

class ProductState {
  const ProductState({this.products = const [], this.errorMessage});
  final List<ProductModel> products;
  final String? errorMessage;

  ProductState copyWith({List<ProductModel>? products, String? errorMessage}) =>
      ProductState(
        products: products ?? this.products,
        errorMessage: errorMessage,
      );
}
