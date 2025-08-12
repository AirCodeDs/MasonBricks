// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/providers/data_sources/product_remote_data_source_provider.dart';
import 'package:urban_transport/features/product/data/repositories/product_remote_repository.dart';

part 'product_remote_repository_provider.g.dart';

@riverpod
ProductRemoteRepository productRemoteRepository(Ref ref) {
  final remoteDataSource = ref.read(productRemoteDataSourceProvider);
  return ProductRemoteRepository(remoteDataSource: remoteDataSource);
}
