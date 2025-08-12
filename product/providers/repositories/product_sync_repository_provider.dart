// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/providers/data_sources/product_sync_data_source_provider.dart';
import 'package:urban_transport/features/product/data/repositories/product_sync_repository.dart';

part 'product_sync_repository_provider.g.dart';

@riverpod
ProductSyncRepository productSyncRepository(Ref ref) {
  final syncDataSource = ref.read(productSyncDataSourceProvider);
  return ProductSyncRepository(
    syncDataSource: syncDataSource,
  );
}
