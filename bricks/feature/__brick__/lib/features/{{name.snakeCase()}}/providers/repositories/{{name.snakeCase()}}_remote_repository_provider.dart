// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/data_sources/{{name.snakeCase()}}_remote_data_source_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_remote_repository.dart';

part '{{name.snakeCase()}}_remote_repository_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteRepository {{name.camelCase()}}RemoteRepository(Ref ref) {
  final remoteDataSource = ref.read({{name.camelCase()}}RemoteDataSourceProvider);
  return {{name.pascalCase()}}RemoteRepository(remoteDataSource: remoteDataSource);
}


