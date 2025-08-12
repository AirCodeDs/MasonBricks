// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_sync_data_source_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_sync_repository.dart';

part '{{name.snakeCase()}}_sync_repository_provider.g.dart';

@riverpod
{{name.pascalCase()}}SyncRepository {{name.camelCase()}}SyncRepository(Ref ref) {
  final syncDataSource = ref.read({{name.camelCase()}}SyncDataSourceProvider);
  return {{name.pascalCase()}}SyncRepository(
    syncDataSource: syncDataSource,
  );
}


