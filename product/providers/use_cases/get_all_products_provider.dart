// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/use_cases/get_all_products.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_repository_provider.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_sync_repository_provider.dart';

// Export the params for use in presentation layer
export 'package:hbh_connect/features/product/application/use_cases/get_all_products.dart'
    show GetAllProductParams;

part 'get_all_products_provider.g.dart';

@riverpod
GetAllProducts getAllProducts(Ref ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetAllProducts(repository);
}

@riverpod
GetAllProducts getAllSyncProducts(Ref ref) {
  final repository = ref.read(productSyncRepositoryProvider);
  return GetAllProducts(repository);
}
