// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/data/data_sources/product_sync_data_source.dart';
import 'package:urban_transport/core/providers/api_provider/api_provider.dart';

part 'product_sync_data_source_provider.g.dart';

@riverpod
ProductSyncDataSource productSyncDataSource(Ref ref) {
  final syncApiClient = ref.read(syncApiClientProvider);
  return ProductSyncDataSource(syncApiClient: syncApiClient);
}
