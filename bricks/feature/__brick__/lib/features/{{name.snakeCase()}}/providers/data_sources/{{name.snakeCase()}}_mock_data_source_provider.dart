// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';

part 'product_mock_data_source_Provider.g.dart';

@riverpod
{{name.pascalCase()}}MockDataSource {{name.pascalCase()}}MockDataSource(Ref ref) {
  final mockApiClient = ref.read(mockApiClientProvider);
  return {{name.pascalCase()}}MockDataSource(apiClient: mockApiClient);
}
