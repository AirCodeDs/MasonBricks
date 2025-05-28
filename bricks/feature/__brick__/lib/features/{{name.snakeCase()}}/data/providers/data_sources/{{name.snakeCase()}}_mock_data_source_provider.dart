// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakecase()}}/data/data_sources/{{name.snakecase()}}_mock_data_source.dart';
import 'package:urban_transport/services/api/providers/api_provider.dart';

part '{{name.snakecase()}}_mock_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}MockDataSource {{name.snakecase()}}MockDataSource(Ref ref) {
  final mockApi = ref.read(mockApiProvider);
  return {{name.pascalCase()}}MockDataSource(mockApi: mockApi);
}
