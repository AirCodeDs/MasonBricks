// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snake_case()}}/data/data_sources/{{name.snake_case()}}_local_data_source.dart';
import 'package:urban_transport/services/api/providers/api_provider.dart';

part '{{name.snake_case()}}_local_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}LocalDataSource {{name.snake_case()}}LocalDataSource(Ref ref) {
  final localApi = ref.read(localApiProvider);
  return {{name.pascalCase()}}LocalDataSource(localApi: localApi);
}
