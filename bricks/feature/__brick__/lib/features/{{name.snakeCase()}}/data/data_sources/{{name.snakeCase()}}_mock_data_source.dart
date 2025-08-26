// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/base_data_sources/base_product_core_data_source.dart';

class {{name.pascalCase()}}MockDataSource extends Base{{name.pascalCase()}}CoreDataSource {
  {{name.pascalCase()}}MockDataSource({required super.apiClient});
}
