// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/use_cases/get_product_by_id.dart';
import 'package:hbh_connect/features/product/providers/repositories/product_repository_provider.dart';

// Export the params for use in presentation layer
export 'package:hbh_connect/features/product/application/use_cases/get_product_by_id.dart'
    show GetProductByIdParams;

part 'get_product_by_id_provider.g.dart';

@riverpod
GetProductById getProductById(Ref ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetProductById(repository);
}
