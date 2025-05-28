// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snake_case()}}/data/providers/data_sources/{{name.snake_case()}}_remote_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/repositories/{{name.snake_case()}}_remote_repository_impl.dart';

part '{{name.snake_case()}}_remote_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteRepositoryImpl {{name.snake_case()}}RemoteRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snake_case()}}RemoteDataSourceProvider);
  return {{name.pascalCase()}}RemoteRepositoryImpl(remoteDataSource: remoteDataSource);
}
