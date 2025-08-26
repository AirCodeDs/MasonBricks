// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/contracts/{{name.snakeCase()}}_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/base_product_repository/base_product_sync_repository.dart';

class {{name.pascalCase()}}SyncRepository extends Base{{name.pascalCase()}}SyncRepository {
  {{name.pascalCase()}}SyncRepository({required {{name.pascalCase()}}SyncDataSource syncDataSource})
    : super(syncDataSource);
}
