// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';

// Export the params for use in presentation layer
export 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart'
    show Add{{name.pascalCase()}}Params;

part 'add_{{name.snakeCase()}}_provider.g.dart';

@riverpod
Add{{name.pascalCase()}} add{{name.pascalCase()}}(Ref ref) {
  final repository = ref.read({{name.camelCase()}}RepositoryProvider);
  return Add{{name.pascalCase()}}(repository);
}


