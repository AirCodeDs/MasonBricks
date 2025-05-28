// Package imports:
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/errors/failure_message_resolver.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/data/providers/repositories/product_remote_synced_in_local_repository_impl_provider.dart';
import 'package:urban_transport/features/product/domain/use_cases/add_product.dart';
import 'package:urban_transport/features/product/domain/use_cases/delete_product.dart';
import 'package:urban_transport/features/product/domain/use_cases/get_all_products.dart';
import 'package:urban_transport/features/product/domain/use_cases/get_product_by_id.dart';
import 'package:urban_transport/features/product/domain/use_cases/update_product.dart';
import 'package:urban_transport/features/product/presentation/providers/product_state.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  late final AddProduct _addProduct;
  late final UpdateProduct _updateProduct;
  late final DeleteProduct _deleteProduct;
  late final GetAllProducts _getAllProducts;
  late final GetProductById _getProductById;

  PaginationDataModel<List<ProductModel>>? _paginationData;

  @override
  FutureOr<ProductState> build() async {
    final productRemoteSyncedInLocalRepositoryImpl = ref.read(
      productRemoteSyncedInLocalRepositoryImplProvider,
    );

    _addProduct = AddProduct(productRemoteSyncedInLocalRepositoryImpl);
    _updateProduct = UpdateProduct(productRemoteSyncedInLocalRepositoryImpl);
    _deleteProduct = DeleteProduct(productRemoteSyncedInLocalRepositoryImpl);
    _getAllProducts = GetAllProducts(productRemoteSyncedInLocalRepositoryImpl);
    _getProductById = GetProductById(productRemoteSyncedInLocalRepositoryImpl);

    final products = await fetchProducts();
    return ProductState(products: products);
  }

  Future<List<ProductModel>> fetchProducts({bool loadMore = false}) async {
    state = const AsyncLoading();
    final result = await _getAllProducts(
      GetAllProductParams(
        paginationPageIndex: loadMore
            ? _paginationData?.getNextPageIndex() ?? 1
            : 1,
      ),
    );

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(ProductState(products: [], errorMessage: errorMsg));
        return [];
      },
      (paginationData) {
        _paginationData = paginationData;
        final currentItems = state.value?.products ?? [];
        final newItems = [...currentItems, ...paginationData.child];
        state = AsyncData(ProductState(products: newItems));
        return newItems;
      },
    );
  }

  Future<Either<Failure, ProductModel>> addProduct(
    AddProductParams addProductParams,
  ) async {
    final result = await _addProduct(addProductParams);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (success) {
        fetchProducts();
        return Right(success);
      },
    );
  }

  Future<Either<Failure, ProductModel>> updateProduct(
    UpdateProductParams updateProductParams,
  ) async {
    final result = await _updateProduct(updateProductParams);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (updatedProduct) {
        final currentItems = state.value?.products ?? [];
        final updatedItems = currentItems
            .map(
              (item) =>
                  item.id ==
                      updateProductParams
                          .urlParams
                          .first //basicaly the id of the product
                  ? updatedProduct
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith(products: updatedItems));
        return Right(updatedProduct);
      },
    );
  }

  Future<Either<Failure, ApiResponse>> deleteProduct(
    DeleteProductParams deleteProductParams,
  ) async {
    final result = await _deleteProduct(deleteProductParams);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (apiResponse) {
        final currentItems = state.value?.products ?? [];
        final updatedItems = currentItems
            .where((item) => item.id != deleteProductParams.urlParams.first)
            .toList();

        state = AsyncData(state.value!.copyWith(products: updatedItems));
        return Right(apiResponse);
      },
    );
  }

  Future<Either<Failure, ProductModel>> getProductById(
    GetProductByIdParams getProductByIdParams,
  ) async {
    final result = await _getProductById(getProductByIdParams);
    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (productModel) {
        final currentItems = state.value?.products ?? [];
        final updatedItems = currentItems
            .map(
              (item) => item.id == getProductByIdParams.urlParams.first
                  ? productModel
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith(products: updatedItems));
        return Right(productModel);
      },
    );
  }

  String? get currentError => state.whenOrNull(
    data: (value) => value.errorMessage,
    error: (error, _) => error.toString(),
  );

  void clearState() {
    _paginationData = null;
    state = const AsyncData(ProductState());
  }
}
