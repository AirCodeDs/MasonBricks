// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_mock_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_mock_data_source_Provider.dart';

part 'product_mock_repository_Provider.g.dart';

@riverpod
{{name.pascalCase()}}MockRepository {{name.pascalCase()}}MockRepository(Ref ref) {
  final mockDataSource = ref.read({{name.pascalCase()}}MockDataSourceProvider);
  return {{name.pascalCase()}}MockRepository(mockDataSource: mockDataSource);
}
