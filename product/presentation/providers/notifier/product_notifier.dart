// Package imports:
// ignore_for_file: unused_import

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/commands/add_product_command.dart';
import 'package:hbh_connect/features/product/application/commands/delete_product_command.dart';
import 'package:hbh_connect/features/product/application/commands/fetch_products_command.dart';
import 'package:hbh_connect/features/product/application/commands/get_product_by_id_command.dart';
import 'package:hbh_connect/features/product/application/commands/sync_products_command.dart';
import 'package:hbh_connect/features/product/application/commands/update_product_command.dart';
import 'package:hbh_connect/features/product/application/notifier_context/product_notifier_context.dart';
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';
import 'package:hbh_connect/features/product/providers/use_cases/add_product_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/delete_product_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/get_all_products_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/get_product_by_id_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/sync_products_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/update_product_provider.dart';

// Project imports:

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  PaginationDataModel<List<Product>>? _paginationData;

  @override
  ProductState build() {
    unawaited(fetchProducts());
    return const ProductState();
  }

  Future<void> fetchProducts() async {
    final isConnected = await ref.read(networkInfoProvider).isConnected;
    final context = _buildActionContext();
    final getAllProductsUseCase = isConnected
        ? ref.read(getAllProductsProvider)
        : ref.read(getAllSyncProductsProvider);

    await FetchProductsCommand(
      context: context,
      getAllProducts: getAllProductsUseCase,
      paginationData: _paginationData,
      updatePagination: (data) => _paginationData = data,
    ).execute();
  }

  Future<void> addProduct(AddProductParams addProductParams) async {
    final context = _buildActionContext();
    final addProductUseCase = ref.read(addProductProvider);

    await AddProductCommand(
      context: context,
      addProduct: addProductUseCase,
      params: addProductParams,
    ).execute();
  }

  Future<void> updateProduct(UpdateProductParams updateProductParams) async {
    final context = _buildActionContext();
    final updateProductUseCase = ref.read(updateProductProvider);

    await UpdateProductCommand(
      context: context,
      updateProduct: updateProductUseCase,
      params: updateProductParams,
    ).execute();
  }

  Future<void> getProductById(GetProductByIdParams getProductByIdParams) async {
    final context = _buildActionContext();
    final getProductByIdUseCase = ref.read(getProductByIdProvider);

    await GetProductByIdCommand(
      context: context,
      getProductById: getProductByIdUseCase,
      params: getProductByIdParams,
    ).execute();
  }

  Future<void> deleteProduct(DeleteProductParams deleteProductParams) async {
    final context = _buildActionContext();
    final deleteProductUseCase = ref.read(deleteProductProvider);

    await DeleteProductCommand(
      context: context,
      deleteProduct: deleteProductUseCase,
      params: deleteProductParams,
    ).execute();
  }

  void syncProducts() {
    final products = state.products;
    final syncProductsUseCase = ref.read(syncProductsProvider);

    unawaited(
      SyncProductsCommand(
        products: products,
        syncProducts: syncProductsUseCase,
      ).execute(),
    );
  }

  void clearState() {
    _paginationData = null;
    state = const ProductState();
  }

  ProductNotifierContext _buildActionContext() => ProductNotifierContext(
    currentState: state,
    ref: ref,
    onNewState: (newState) async {
      state = newState;
      final isConnected = await ref.read(networkInfoProvider).isConnected;

      if (isConnected) {
        syncProducts();
      }
    },
  );
}
