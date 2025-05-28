// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/providers/data_sources/{{name.snakeCase()}}_remote_data_source_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_remote_repository_impl.dart';

part '{{name.snakeCase()}}_remote_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteRepositoryImpl {{name.snakeCase()}}RemoteRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snakeCase()}}RemoteDataSourceProvider);
  return {{name.pascalCase()}}RemoteRepositoryImpl(remoteDataSource: remoteDataSource);
}
