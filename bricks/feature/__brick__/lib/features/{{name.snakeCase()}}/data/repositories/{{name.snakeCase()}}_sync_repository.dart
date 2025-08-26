// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/base_{{name.snakeCase()}}_repository/base_{{name.snakeCase()}}_sync_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_sync_data_source.dart';

class {{name.pascalCase()}}SyncRepository extends Base{{name.pascalCase()}}SyncRepository {
  {{name.pascalCase()}}SyncRepository({
    required {{name.pascalCase()}}SyncDataSource syncDataSource,
  }) : super(syncDataSource);
}


