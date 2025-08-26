// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/base_data_sources/base_product_core_data_source.dart';

class {{name.pascalCase()}}HttpRestDataSource extends Base{{name.pascalCase()}}CoreDataSource {
  {{name.pascalCase()}}HttpRestDataSource({required super.apiClient});
}
