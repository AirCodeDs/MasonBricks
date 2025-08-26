// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/data_sources/product_sync_data_source.dart';

part 'product_sync_data_source_provider.g.dart';

@riverpod
ProductSyncDataSource productSyncDataSource(Ref ref) {
  final syncApiClient = ref.read(syncApiClientProvider);
  return ProductSyncDataSource(syncApiClient: syncApiClient);
}
