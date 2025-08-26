// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_sync_data_source.dart';

part 'product_sync_data_source_Provider.g.dart';

@riverpod
{{name.pascalCase()}}SyncDataSource {{name.pascalCase()}}SyncDataSource(Ref ref) {
  final syncApiClient = ref.read(syncApiClientProvider);
  return {{name.pascalCase()}}SyncDataSource(syncApiClient: syncApiClient);
}
