import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_{{name.snakeCase()}}_by_id.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';

export 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_{{name.snakeCase()}}_by_id.dart'
    show Get{{name.pascalCase()}}ByIdParams;

part 'get_{{name.snakeCase()}}_by_id_provider.g.dart';

@riverpod
Get{{name.pascalCase()}}ById get{{name.pascalCase()}}ById(Ref ref) {
  final repository = ref.read({{name.camelCase()}}RepositoryProvider);
  return Get{{name.pascalCase()}}ById(repository);
}


