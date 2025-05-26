import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/services/api/api_client/api_client.dart';

part '{{name.snakeCase()}}_remote_data_source_provider.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}RemoteDataSource {{name.camelCase()}}RemoteDataSource(
  {{name.pascalCase()}}RemoteDataSourceRef ref,
) {
  final apiClient = ref.read(apiClientProvider);
  return {{name.pascalCase()}}RemoteDataSource(apiClient);
}