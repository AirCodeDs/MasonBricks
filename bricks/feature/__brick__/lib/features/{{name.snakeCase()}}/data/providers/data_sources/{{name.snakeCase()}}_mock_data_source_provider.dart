// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:urban_transport/services/api_client/providers/api_provider.dart';

part '{{name.snakeCase()}}_mock_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockDataSource {{name.snakeCase()}}MockDataSource(Ref ref) {
  final mockApiClient = ref.read(mockApiClientProvider);
  return {{name.pascalCase()}}MockDataSource(mockApiClient: mockApiClient);
}
