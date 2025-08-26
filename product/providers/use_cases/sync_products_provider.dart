// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/use_cases/sync_products.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_sync_repository_provider.dart';

part 'sync_products_provider.g.dart';

@riverpod
SyncProducts syncProducts(Ref ref) {
  final repository = ref.read(productSyncRepositoryProvider);
  return SyncProducts(repository);
}
