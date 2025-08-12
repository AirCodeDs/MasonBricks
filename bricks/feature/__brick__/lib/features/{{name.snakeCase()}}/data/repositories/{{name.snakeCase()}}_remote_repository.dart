// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/base_{{name.snakeCase()}}_repository/base_{{name.snakeCase()}}_core_repository.dart';

// P
class {{name.pascalCase()}}RemoteRepository extends Base{{name.pascalCase()}}CoreRepository {
  {{name.pascalCase()}}RemoteRepository({
    required {{name.pascalCase()}}RemoteDataSource remoteDataSource,
  }) : super(remoteDataSource);
}


