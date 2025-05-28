// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/core/network/network_info_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/providers/data_sources/{{name.snakecase()}}_local_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/providers/data_sources/{{name.snakecase()}}_remote_data_source_provider.dart';
import 'package:urban_transport/features/{{name.snakecase()}}/data/repositories/{{name.snakecase()}}_remote_synced_in_local_repository_impl.dart';

part '{{name.snakecase()}}_remote_synced_in_local_repository_impl_provider.g.dart';

@riverpod
{{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl
{{name.snakecase()}}RemoteSyncedInLocalRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read({{name.snakecase()}}RemoteDataSourceProvider);
  final localDataSource = ref.read({{name.snakecase()}}LocalDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return {{name.pascalCase()}}RemoteSyncedInLocalRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );
}
