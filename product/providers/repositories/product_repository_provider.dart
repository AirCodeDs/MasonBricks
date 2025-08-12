// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/core/providers/flavor/app_flavor_provider.dart';
import 'package:urban_transport/features/product/providers/repositories/product_mock_repository_provider.dart';
import 'package:urban_transport/features/product/providers/repositories/product_remote_repository_provider.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  final isMockFlavor = ref.read(isMockFlavorProvider);
  if (isMockFlavor) {
    return ref.read(productMockRepositoryProvider);
  }
  return ref.read(productRemoteRepositoryProvider);
}
