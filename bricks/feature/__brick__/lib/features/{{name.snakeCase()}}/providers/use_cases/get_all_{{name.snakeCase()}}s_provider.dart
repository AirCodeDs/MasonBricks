// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_all_products.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_Provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_sync_repository_Provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_all_products.dart'
    show GetAllProductParams;

part 'get_all_{{name.snakeCase()}}s_provider.g.dart';

@riverpod
GetAll{{name.pascalCase()}}s GetAll{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}RepositoryProvider);
  return GetAll{{name.pascalCase()}}s(repository);
}

@riverpod
GetAll{{name.pascalCase()}}s getAllSync{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}SyncRepositoryProvider);
  return GetAll{{name.pascalCase()}}s(repository);
}
