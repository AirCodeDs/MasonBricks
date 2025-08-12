import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Mapper {
  const {{name.pascalCase()}}Mapper();

  {{name.pascalCase()}}Model toModel({{name.pascalCase()}} entity) => {{name.pascalCase()}}Model(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        category: entity.category,
        price: entity.price,
      );

  {{name.pascalCase()}} toEntity({{name.pascalCase()}}Model model) => {{name.pascalCase()}}(
        id: model.id,
        name: model.name,
        description: model.description,
        category: model.category,
        price: model.price,
      );

  List<{{name.pascalCase()}}Model> toModelList(List<{{name.pascalCase()}}> entities) =>
      entities.map(toModel).toList();

  List<{{name.pascalCase()}}> toEntityList(List<{{name.pascalCase()}}Model> models) =>
      models.map(toEntity).toList();
}


