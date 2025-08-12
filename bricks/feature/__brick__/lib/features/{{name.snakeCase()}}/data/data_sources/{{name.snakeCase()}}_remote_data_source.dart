import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/base_data_sources/base_{{name.snakeCase()}}_core_data_source.dart';

class {{name.pascalCase()}}RemoteDataSource extends Base{{name.pascalCase()}}CoreDataSource {
  {{name.pascalCase()}}RemoteDataSource({required super.apiClient});
}
