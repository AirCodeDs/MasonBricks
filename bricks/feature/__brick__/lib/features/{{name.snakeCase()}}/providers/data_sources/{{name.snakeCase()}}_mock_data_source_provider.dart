// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/core/providers/api_provider/api_provider.dart';

part '{{name.snakeCase()}}_mock_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockDataSource {{name.camelCase()}}MockDataSource(Ref ref) {
  final mockApiClient = ref.read(mockApiClientProvider);
  return {{name.pascalCase()}}MockDataSource(apiClient: mockApiClient);
}


