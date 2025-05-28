// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/data/providers/data_sources/product_remote_data_source_provider.dart';
import 'package:urban_transport/features/product/data/repositories/product_remote_repository_impl.dart';

part 'product_remote_repository_impl_provider.g.dart';

@riverpod
ProductRemoteRepositoryImpl productRemoteRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.read(productRemoteDataSourceProvider);
  return ProductRemoteRepositoryImpl(remoteDataSource: remoteDataSource);
}
