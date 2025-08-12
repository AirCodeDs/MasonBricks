// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_sync_data_source.dart';
import 'package:{{project_name}}/core/providers/api_provider/api_provider.dart';

part '{{name.snakeCase()}}_sync_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}SyncDataSource {{name.camelCase()}}SyncDataSource(Ref ref) {
  final syncApiClient = ref.read(syncApiClientProvider);
  return {{name.pascalCase()}}SyncDataSource(syncApiClient: syncApiClient);
}


