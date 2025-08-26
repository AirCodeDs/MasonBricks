// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_http_rest_data_source.dart';

// Project imports:

part 'product_http_rest_data_source_Provider.g.dart';

@riverpod
{{name.pascalCase()}}HttpRestDataSource {{name.pascalCase()}}HttpRestDataSource(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return {{name.pascalCase()}}HttpRestDataSource(apiClient: apiClient);
}
