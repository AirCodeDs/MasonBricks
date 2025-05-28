// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/providers/data_sources/{{name.snakeCase()}}_local_data_source_provider.dart';
import package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_local_repository_impl.dart';

part '{{name.snakeCase()}}_local_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}LocalRepositoryImpl {{name.snakeCase()}}LocalRepositoryImpl(Ref ref) {
  final localDataSource = ref.read({{name.snakeCase()}}LocalDataSourceProvider);
  return {{name.pascalCase()}}LocalRepositoryImpl(localDataSource: localDataSource);
}
