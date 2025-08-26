// ignore_for_file: avoid_dynamic_calls

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_http_rest_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/base_product_repository/base_product_core_repository.dart';

//
class {{name.pascalCase()}}HttpRestRepository extends BaseProductCoreRepository {
  {{name.pascalCase()}}HttpRestRepository({
    required {{name.pascalCase()}}HttpRestDataSource httpRestDataSource,
  }) : super(httpRestDataSource);
}
