// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/delete_product.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_Provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/delete_product.dart'
    show Delete{{name.pascalCase()}}Params;

part 'delete_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Delete{{name.pascalCase()}} Delete{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}RepositoryProvider);
  return Delete{{name.pascalCase()}}(repository);
}
