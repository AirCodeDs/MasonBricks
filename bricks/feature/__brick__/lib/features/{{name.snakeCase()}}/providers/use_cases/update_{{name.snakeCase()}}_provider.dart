import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/update_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';

export 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/update_{{name.snakeCase()}}.dart'
    show Update{{name.pascalCase()}}Params;

part 'update_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Update{{name.pascalCase()}} update{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.camelCase()}}RepositoryProvider);
  return Update{{name.pascalCase()}}(repository);
}


