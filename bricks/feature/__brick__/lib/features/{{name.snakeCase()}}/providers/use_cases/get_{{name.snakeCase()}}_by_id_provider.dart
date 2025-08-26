// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_product_by_id.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_Provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_product_by_id.dart'
    show Get{{name.pascalCase()}}ByIdParams;

part 'get_{{name.snakeCase()}}_by_id_provider.g.dart';

@riverpod
Get{{name.pascalCase()}}ById Get{{name.pascalCase()}}ById(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}RepositoryProvider);
  return Get{{name.pascalCase()}}ById(repository);
}
