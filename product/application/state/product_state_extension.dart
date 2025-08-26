// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';

extension ProductStateX on ProductState {
  ProductState withLoading(ProductOperation op) => copyWith(
    operationStatuses: {...operationStatuses, op: OperationStatus.loading},
    errors: {...errors, op: null},
  );

  ProductState withSuccess(ProductOperation op, {List<Product>? products}) =>
      copyWith(
        products: products ?? this.products,
        operationStatuses: {...operationStatuses, op: OperationStatus.success},
        errors: {...errors, op: null},
      );

  ProductState withError(ProductOperation op, String message) => copyWith(
    operationStatuses: {...operationStatuses, op: OperationStatus.error},
    errors: {...errors, op: message},
  );

  ProductState withIdle(ProductOperation op) => copyWith(
    operationStatuses: {...operationStatuses, op: OperationStatus.idle},
    errors: {...errors, op: null},
  );

  // Convenience getters to check the status of an operation
  bool isLoading(ProductOperation op) =>
      operationStatuses[op] == OperationStatus.loading;

  bool isSuccess(ProductOperation op) =>
      operationStatuses[op] == OperationStatus.success;

  bool isError(ProductOperation op) =>
      operationStatuses[op] == OperationStatus.error;

  String? errorMessage(ProductOperation op) => errors[op];
}

extension ProductStateFlags on ProductState {
  // === addProduct ===
  bool get isLoadingAddProduct =>
      operationStatuses[ProductOperation.addProduct] == OperationStatus.loading;

  bool get isSuccessAddProduct =>
      operationStatuses[ProductOperation.addProduct] == OperationStatus.success;

  bool get isErrorAddProduct =>
      operationStatuses[ProductOperation.addProduct] == OperationStatus.error;

  String? get errorAddProduct => errors[ProductOperation.addProduct];

  // === fetchProducts ===
  bool get isLoadingFetchProducts =>
      operationStatuses[ProductOperation.fetchProducts] ==
      OperationStatus.loading;

  bool get isSuccessFetchProducts =>
      operationStatuses[ProductOperation.fetchProducts] ==
      OperationStatus.success;

  bool get isErrorFetchProducts =>
      operationStatuses[ProductOperation.fetchProducts] ==
      OperationStatus.error;

  bool get isProductsEmpty => products.isEmpty;

  String? get errorFetchProducts => errors[ProductOperation.fetchProducts];

  // === updateProduct ===
  bool get isLoadingUpdateProduct =>
      operationStatuses[ProductOperation.updateProduct] ==
      OperationStatus.loading;

  bool get isSuccessUpdateProduct =>
      operationStatuses[ProductOperation.updateProduct] ==
      OperationStatus.success;

  bool get isErrorUpdateProduct =>
      operationStatuses[ProductOperation.updateProduct] ==
      OperationStatus.error;

  String? get errorUpdateProduct => errors[ProductOperation.updateProduct];

  // === deleteProduct ===
  bool get isLoadingDeleteProduct =>
      operationStatuses[ProductOperation.deleteProduct] ==
      OperationStatus.loading;

  bool get isSuccessDeleteProduct =>
      operationStatuses[ProductOperation.deleteProduct] ==
      OperationStatus.success;

  bool get isErrorDeleteProduct =>
      operationStatuses[ProductOperation.deleteProduct] ==
      OperationStatus.error;

  String? get errorDeleteProduct => errors[ProductOperation.deleteProduct];

  // === getProductById ===
  bool get isLoadingGetProductById =>
      operationStatuses[ProductOperation.getProductById] ==
      OperationStatus.loading;

  bool get isSuccessGetProductById =>
      operationStatuses[ProductOperation.getProductById] ==
      OperationStatus.success;

  bool get isErrorGetProductById =>
      operationStatuses[ProductOperation.getProductById] ==
      OperationStatus.error;

  String? get errorGetProductById => errors[ProductOperation.getProductById];

  ProductState clearOperation(ProductOperation op) => copyWith(
    operationStatuses: Map<ProductOperation, OperationStatus>.from(
      operationStatuses,
    )..remove(op),
    errors: Map<ProductOperation, String?>.from(errors)..remove(op),
  );

  ProductState withClearedErrors() => copyWith(errors: const {});
}
