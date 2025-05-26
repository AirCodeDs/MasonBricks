import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/providers/{{name.snakeCase()}}_remote_data_source_provider.dart';

part '{{name.snakeCase()}}_repository_impl_provider.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}RepositoryImpl(
  {{name.camelCase()}}RepositoryImplRef ref,
) {
  final remoteDataSource = ref.read({{name.camelCase()}}RemoteDataSourceProvider);
  // final localDataSource = ref.read({{name.camelCase()}}LocalDataSourceProvider); // Uncomment if you have a local data source
  return {{name.pascalCase()}}RepositoryImpl(remoteDataSource /* , localDataSource */);
}


