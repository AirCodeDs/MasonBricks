// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/repositories/product_repository.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_mock_repository_provider.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_http_rest_repository_provider.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  final isMockFlavor = ref.read(isMockFlavorProvider);
  if (isMockFlavor) {
    return ref.read(productMockRepositoryProvider);
  }
  return ref.read(productHttpRestRepositoryProvider);
}
