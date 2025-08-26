// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/update_product.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_Provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/update_product.dart'
    show Update{{name.pascalCase()}}Params;

part 'update_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Update{{name.pascalCase()}} Update{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}RepositoryProvider);
  return Update{{name.pascalCase()}}(repository);
}
