// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_mock_repository_Provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_http_rest_repository_Provider.dart';

part 'product_repository_Provider.g.dart';

@riverpod
{{name.pascalCase()}}Repository {{name.pascalCase()}}Repository(Ref ref) {
  final isMockFlavor = ref.read(isMockFlavorProvider);
  if (isMockFlavor) {
    return ref.read({{name.pascalCase()}}MockRepositoryProvider);
  }
  return ref.read({{name.pascalCase()}}HttpRestRepositoryProvider);
}
