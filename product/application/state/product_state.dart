// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/domain/entities/product.dart';

part 'product_state.freezed.dart';

enum ProductOperation {
  fetchProducts,
  addProduct,
  updateProduct,
  deleteProduct,
  getProductById,
}

enum OperationStatus { idle, loading, success, error }

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<Product> products,
    @Default({}) Map<ProductOperation, OperationStatus> operationStatuses,
    @Default({}) Map<ProductOperation, String?> errors,
  }) = _ProductState;
}
