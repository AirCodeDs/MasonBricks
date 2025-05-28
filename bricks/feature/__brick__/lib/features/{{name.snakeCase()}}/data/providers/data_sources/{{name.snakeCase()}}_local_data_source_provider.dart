// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:urban_transport/services/api_client/providers/api_provider.dart';

part '{{name.snakeCase()}}_local_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}LocalDataSource {{name.snakeCase()}}LocalDataSource(Ref ref) {
  final localApiClient = ref.read(localApiClientProvider);
  return {{name.pascalCase()}}LocalDataSource(localApiClient: localApiClient);
}
