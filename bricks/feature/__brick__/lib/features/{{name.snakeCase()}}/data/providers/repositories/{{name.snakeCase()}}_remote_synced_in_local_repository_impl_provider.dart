// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{name.snakeCase()}}/core/network/network_info_provider.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/providers/data_sources/{{name.snakeCase()}}_local_data_source_provider.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/providers/data_sources/{{name.snakeCase()}}_remote_data_source_provider.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_remote_synced_in_local_repository_impl.dart';

part '{{name.snakeCase()}}_remote_synced_in_local_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl
{{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snakeCase()}}RemoteDataSourceProvider);
  final localDataSource = ref.read({{name.snakeCase()}}LocalDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return {{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
}
