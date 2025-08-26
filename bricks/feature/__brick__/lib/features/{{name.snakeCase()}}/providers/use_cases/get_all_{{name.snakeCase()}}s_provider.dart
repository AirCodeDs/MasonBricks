// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_all_{{name.snakeCase()}}s.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_sync_repository_provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_all_{{name.snakeCase()}}s.dart'
    show GetAll{{name.pascalCase()}}Params;

part 'get_all_{{name.snakeCase()}}s_provider.g.dart';

@riverpod
GetAll{{name.pascalCase()}}s getAll{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.camelCase()}}RepositoryProvider);
  return GetAll{{name.pascalCase()}}s(repository);
}

@riverpod
GetAll{{name.pascalCase()}}s getAllSync{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.camelCase()}}SyncRepositoryProvider);
  return GetAll{{name.pascalCase()}}s(repository);
}


