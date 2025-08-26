// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_sync_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_sync_data_source_Provider.dart';

part 'product_sync_repository_Provider.g.dart';

@riverpod
{{name.pascalCase()}}SyncRepository {{name.pascalCase()}}SyncRepository(Ref ref) {
  final syncDataSource = ref.read({{name.pascalCase()}}SyncDataSourceProvider);
  return {{name.pascalCase()}}SyncRepository(syncDataSource: syncDataSource);
}
