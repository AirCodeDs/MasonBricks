// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/add_product.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_Provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/add_product.dart'
    show Add{{name.pascalCase()}}Params;

part 'add_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Add{{name.pascalCase()}} Add{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}RepositoryProvider);
  return Add{{name.pascalCase()}}(repository);
}
