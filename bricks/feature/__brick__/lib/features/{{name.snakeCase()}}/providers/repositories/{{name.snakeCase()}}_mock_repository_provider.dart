// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_mock_data_source_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_mock_repository.dart';

part '{{name.snakeCase()}}_mock_repository_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockRepository {{name.camelCase()}}MockRepository(Ref ref) {
  final mockDataSource = ref.read({{name.camelCase()}}MockDataSourceProvider);
  return {{name.pascalCase()}}MockRepository(mockDataSource: mockDataSource);
}


