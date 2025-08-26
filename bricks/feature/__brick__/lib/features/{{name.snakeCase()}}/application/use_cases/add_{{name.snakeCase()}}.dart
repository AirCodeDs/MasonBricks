// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Add{{name.pascalCase()}} implements UseCase<{{name.pascalCase()}}, Add{{name.pascalCase()}}Params> {
  Add{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> call(
    Add{{name.pascalCase()}}Params params,
  ) =>
      _repository.add{{name.pascalCase()}}(params);
}

class Add{{name.pascalCase()}}Params extends FieldParams {
  Add{{name.pascalCase()}}Params({
    required String name,
    required String description,
    required String category,
    required double price,
  }) : super(
          fieldParams: {
            'name': name,
            'description': description,
            'category': category,
            'price': price,
          },
        );
}


