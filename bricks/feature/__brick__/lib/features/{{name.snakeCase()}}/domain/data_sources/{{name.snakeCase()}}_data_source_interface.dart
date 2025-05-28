// Project imports:
import 'package:urban_transport/core/params/params.dart';

abstract class ProductDataSourceInterface {
  Future<dynamic> addProduct(FieldParams fieldParams);
  Future<dynamic> updateProduct(UrlAndFieldParams urlAndFieldParams);
  Future<dynamic> getAllProducts(NoParams noParams);
  Future<dynamic> getProductById(UrlParams urlParams);
  Future<dynamic> deleteProduct(UrlParams urlParams);
}
