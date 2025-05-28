// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:urban_transport/services/api/providers/api_provider.dart';

part '{{name.snakeCase()}}_remote_data_source_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteDataSource {{name.snakeCase()}}RemoteDataSource(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return {{name.pascalCase()}}RemoteDataSource(apiClient: apiClient);
}
