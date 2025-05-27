import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/providers/{{name.snakeCase()}}_local_data_source_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/providers/{{name.snakeCase()}}_remote_data_source_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/providers/{{name.snakeCase()}}_mock_data_source_provider.dart';

part '{{name.snakeCase()}}_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}RepositoryImpl(
  Ref ref,
) {
  final remoteDataSource = ref.read({{name.camelCase()}}RemoteDataSourceProvider);
  final mockDataSource = ref.read({{name.camelCase()}}MockDataSourceProvider);
  final localDataSource = ref.read({{name.camelCase()}}LocalDataSourceProvider);
  return {{name.pascalCase()}}RepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    mockDataSource: mockDataSource,
  );
}






