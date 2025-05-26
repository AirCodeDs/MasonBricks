import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/services/api/mock_api/mock_api.dart';

part '{{name.snakeCase()}}_mock_data_source_provider.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}MockDataSource {{name.camelCase()}}MockDataSource(
  {{name.pascalCase()}}MockDataSourceRef ref,
) {
  final mockApi = ref.read(mockApiProvider);
  return {{name.pascalCase()}}MockDataSource(mockApi);
}