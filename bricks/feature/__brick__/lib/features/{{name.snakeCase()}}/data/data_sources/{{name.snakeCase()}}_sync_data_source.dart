import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/base_data_sources/base_sync_data_source.dart';

class {{name.pascalCase()}}SyncDataSource extends BaseSyncDataSource {
  {{name.pascalCase()}}SyncDataSource({required super.syncApiClient});
}


