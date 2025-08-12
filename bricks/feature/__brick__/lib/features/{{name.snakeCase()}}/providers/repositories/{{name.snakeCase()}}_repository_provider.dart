// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/core/providers/flavor/app_flavor_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_mock_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_remote_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_repository_provider.g.dart';

@riverpod
{{name.pascalCase()}}Repository {{name.camelCase()}}Repository(Ref ref) {
  final isMockFlavor = ref.read(isMockFlavorProvider);
  if (isMockFlavor) {
    return ref.read({{name.camelCase()}}MockRepositoryProvider);
  }
  return ref.read({{name.camelCase()}}RemoteRepositoryProvider);
}


