// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Mapper {
  const {{name.pascalCase()}}Mapper();

  {{name.pascalCase()}}Model toModel({{name.snakeCase()}} entity) => {{name.pascalCase()}}Model(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    category: entity.category,
    price: entity.price,
  );

  {{name.snakeCase()}} toEntity({{name.pascalCase()}}Model model) => {{name.snakeCase()}}(
    id: model.id,
    name: model.name,
    description: model.description,
    category: model.category,
    price: model.price,
  );

  List<{{name.pascalCase()}}Model> toModelList(List<{{name.snakeCase()}}> entities) =>
      entities.map(toModel).toList();

  List<{{name.snakeCase()}}> toEntityList(List<{{name.pascalCase()}}Model> models) =>
      models.map(toEntity).toList();
}
