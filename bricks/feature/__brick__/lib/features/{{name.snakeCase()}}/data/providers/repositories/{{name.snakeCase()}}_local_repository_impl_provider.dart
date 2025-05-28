// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakecase()}}/data/providers/data_sources/{{name.snakecase()}}_local_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/repositories/{{name.snakecase()}}_local_repository_impl.dart';

part '{{name.snakecase()}}_local_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}LocalRepositoryImpl {{name.snakecase()}}LocalRepositoryImpl(Ref ref) {
  final localDataSource = ref.read({{name.snakecase()}}LocalDataSourceProvider);
  return {{name.pascalCase()}}LocalRepositoryImpl(localDataSource: localDataSource);
}
