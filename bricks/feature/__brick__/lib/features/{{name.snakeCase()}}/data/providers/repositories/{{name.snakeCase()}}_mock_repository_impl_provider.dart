// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakecase()}}/data/providers/data_sources/{{name.snakecase()}}_mock_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/repositories/{{name.snakecase()}}_mock_repository_impl.dart';

part '{{name.snakecase()}}_mock_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockRepositoryImpl {{name.snakecase()}}LocalRepositoryImpl(Ref ref) {
  final mockDataSource = ref.read({{name.snakecase()}}MockDataSourceProvider);
  return {{name.pascalCase()}}MockRepositoryImpl(mockDataSource: mockDataSource);
}
