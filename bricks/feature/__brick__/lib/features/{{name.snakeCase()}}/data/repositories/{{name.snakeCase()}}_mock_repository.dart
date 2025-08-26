// ignore_for_file: avoid_dynamic_calls

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_mock_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/base_{{name.snakeCase()}}_repository/base_{{name.snakeCase()}}_core_repository.dart';

class {{name.pascalCase()}}MockRepository extends Base{{name.pascalCase()}}CoreRepository {
  {{name.pascalCase()}}MockRepository({
    required {{name.pascalCase()}}MockDataSource mockDataSource,
  }) : super(mockDataSource);
}


