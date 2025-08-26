import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/sync_{{name.snakeCase()}}s.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_sync_repository_provider.dart';

part 'sync_{{name.snakeCase()}}s_provider.g.dart';

@riverpod
Sync{{name.pascalCase()}}s sync{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.camelCase()}}SyncRepositoryProvider);
  return Sync{{name.pascalCase()}}s(repository);
}


