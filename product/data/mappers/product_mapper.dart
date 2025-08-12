import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';

class ProductMapper {
  const ProductMapper();

  ProductModel toModel(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        category: entity.category,
        price: entity.price,
      );

  Product toEntity(ProductModel model) => Product(
        id: model.id,
        name: model.name,
        description: model.description,
        category: model.category,
        price: model.price,
      );

  List<ProductModel> toModelList(List<Product> entities) =>
      entities.map(toModel).toList();

  List<Product> toEntityList(List<ProductModel> models) =>
      models.map(toEntity).toList();
}
