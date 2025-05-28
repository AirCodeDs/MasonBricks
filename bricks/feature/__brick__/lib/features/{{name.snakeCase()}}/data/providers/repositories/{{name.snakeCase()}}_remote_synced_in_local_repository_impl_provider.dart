// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/core/network/network_info_provider.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/providers/data_sources/{{name.snake_case()}}_local_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/providers/data_sources/{{name.snake_case()}}_remote_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/repositories/{{name.snake_case()}}_remote_synced_in_local_repository_impl.dart';

part '{{name.snake_case()}}_remote_synced_in_local_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl
{{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snake_case()}}RemoteDataSourceProvider);
  final localDataSource = ref.read({{name.snake_case()}}LocalDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return {{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
}
