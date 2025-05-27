import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/services/api/providers/api_provider.dart';

part '{{name.snakeCase()}}_remote_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteDataSource {{name.camelCase()}}RemoteDataSource(
  Ref ref,
) {
  final apiClient = ref.read(apiClientProvider);
  return {{name.pascalCase()}}RemoteDataSource(apiClient);
}

