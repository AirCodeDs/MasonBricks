// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_http_rest_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_http_rest_data_source_Provider.dart';

part 'product_http_rest_repository_Provider.g.dart';

@riverpod
{{name.pascalCase()}}HttpRestRepository {{name.pascalCase()}}HttpRestRepository(Ref ref) {
  final remoteDataSource = ref.read({{name.pascalCase()}}HttpRestDataSourceProvider);
  return {{name.pascalCase()}}HttpRestRepository(httpRestDataSource: remoteDataSource);
}
