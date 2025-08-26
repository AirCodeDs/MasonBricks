// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/use_cases/update_product.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_repository_provider.dart';

// Export the params for use in presentation layer
export 'package:hbh_connect/features/product/application/use_cases/update_product.dart'
    show UpdateProductParams;

part 'update_product_provider.g.dart';

@riverpod
UpdateProduct updateProduct(Ref ref) {
  final repository = ref.read(productRepositoryProvider);
  return UpdateProduct(repository);
}
