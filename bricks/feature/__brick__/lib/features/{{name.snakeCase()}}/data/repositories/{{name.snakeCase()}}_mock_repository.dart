// ignore_for_file: avoid_dynamic_calls

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/base_product_repository/base_product_core_repository.dart';

class {{name.pascalCase()}}MockRepository extends BaseProductCoreRepository {
  {{name.pascalCase()}}MockRepository({required {{name.pascalCase()}}MockDataSource mockDataSource})
    : super(mockDataSource);
}
