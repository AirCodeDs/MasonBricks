import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:{{project_name}}/services/api/local_api/local_api.dart';
part '{{name.snakeCase()}}_local_data_source_provider.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}LocalDataSource {{name.camelCase()}}LocalDataSource(
  {{name.camelCase()}}LocalDataSourceRef ref,
) {
  final localApi = ref.read(localApiProvider);
  return {{name.pascalCase()}}LocalDataSource(localApi);
}
