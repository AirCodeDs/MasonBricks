import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/delete_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';

export 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/delete_{{name.snakeCase()}}.dart'
    show Delete{{name.pascalCase()}}Params;

part 'delete_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Delete{{name.pascalCase()}} delete{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.camelCase()}}RepositoryProvider);
  return Delete{{name.pascalCase()}}(repository);
}


