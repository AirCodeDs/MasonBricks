import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/services/api/providers/api_provider.dart';

part '{{name.snakeCase()}}_mock_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockDataSource {{name.camelCase()}}MockDataSource(
  Ref ref,
) {
  final mockApi = ref.read(mockApiProvider);
  return {{name.pascalCase()}}MockDataSource(mockApi);
}

