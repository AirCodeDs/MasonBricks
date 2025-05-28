// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakeCase()}}/data/providers/data_sources/{{name.snakeCase()}}_mock_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_mock_repository_impl.dart';

part '{{name.snakeCase()}}_mock_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockRepositoryImpl {{name.snakeCase()}}LocalRepositoryImpl(Ref ref) {
  final mockDataSource = ref.read({{name.snakeCase()}}MockDataSourceProvider);
  return {{name.pascalCase()}}MockRepositoryImpl(mockDataSource: mockDataSource);
}
