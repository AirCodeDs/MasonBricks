// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_http_rest_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_http_rest_data_source_provider.dart';

part '{{name.snakeCase()}}_http_rest_repository_provider.g.dart';

@riverpod
{{name.pascalCase()}}HttpRestRepository {{name.camelCase()}}HttpRestRepository(Ref ref) {
  final remoteDataSource = ref.read({{name.camelCase()}}HttpRestDataSourceProvider);
  return {{name.pascalCase()}}HttpRestRepository(httpRestDataSource: remoteDataSource);
}


