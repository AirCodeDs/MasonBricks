// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/{{name.snakecase()}}/data/providers/data_sources/{{name.snakecase()}}_remote_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/repositories/{{name.snakecase()}}_remote_repository_impl.dart';

part '{{name.snakecase()}}_remote_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteRepositoryImpl {{name.snakecase()}}RemoteRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snakecase()}}RemoteDataSourceProvider);
  return {{name.pascalCase()}}RemoteRepositoryImpl(remoteDataSource: remoteDataSource);
}
