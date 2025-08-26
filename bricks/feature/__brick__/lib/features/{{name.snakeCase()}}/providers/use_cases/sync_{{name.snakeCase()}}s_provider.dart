// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/sync_products.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_sync_repository_Provider.dart';

part 'sync_{{name.snakeCase()}}s_provider.g.dart';

@riverpod
Sync{{name.pascalCase()}}s Sync{{name.pascalCase()}}s(Ref ref) {
  final repository = ref.read({{name.pascalCase()}}SyncRepositoryProvider);
  return Sync{{name.pascalCase()}}s(repository);
}
