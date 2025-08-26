// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Update{{name.pascalCase()}} extends UseCase<{{name.pascalCase()}}, Update{{name.pascalCase()}}Params> {
  Update{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<ApiResponse<{{name.pascalCase()}}>> call(
    Update{{name.pascalCase()}}Params params,
  ) =>
      _repository.update{{name.pascalCase()}}(params);
}

class Update{{name.pascalCase()}}Params extends UrlAndFieldParams {
  Update{{name.pascalCase()}}Params({
    required String id,
    required String name,
    required String description,
    required String category,
    required double price,
  }) : super(
          urlParams: [id],
          fieldParams: {
            'name': name,
            'description': description,
            'category': category,
            'price': price,
          },
        );
}


