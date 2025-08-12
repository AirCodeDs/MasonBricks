// Package imports:
// ignore_for_file: unused_import

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:urban_transport/core/providers/flavor/app_flavor_provider.dart';
import 'package:urban_transport/config/flavors/app_flavors.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/errors/failure_message_resolver.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/core/providers/network/network_info_provider.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';
import 'package:urban_transport/features/product/providers/repositories/product_mock_repository_provider.dart';
import 'package:urban_transport/features/product/providers/repositories/product_remote_repository_provider.dart';
import 'package:urban_transport/features/product/providers/repositories/product_sync_repository_provider.dart';
import 'package:urban_transport/features/product/data/repositories/product_sync_repository.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository.dart'; // Typo here, should be .dart
import 'package:urban_transport/features/product/Application/use_cases/add_product.dart';
import 'package:urban_transport/features/product/Application/use_cases/delete_product.dart';
import 'package:urban_transport/features/product/Application/use_cases/get_all_products.dart';
import 'package:urban_transport/features/product/Application/use_cases/get_product_by_id.dart';
import 'package:urban_transport/features/product/Application/use_cases/sync_products.dart';
import 'package:urban_transport/features/product/Application/use_cases/update_product.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/add_product_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/update_product_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/delete_product_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/get_product_by_id_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/fetch_products_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/commands/sync_products_command.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/context/product_notifier_context.dart';
import 'package:urban_transport/features/product/providers/repositories/product_repository_provider.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  late final AddProduct _addProduct;
  late final UpdateProduct _updateProduct;
  late final DeleteProduct _deleteProduct;
  late final GetAllProducts _getAllProducts;
  late final GetProductById _getProductById;
  late final SyncProducts _syncProducts;
  late final GetAllProducts _getSyncProducts;

  PaginationDataModel<List<Product>> _paginationData;

  @override
  ProductState build() {
    final productRepository = ref.read(productRepositoryProvider);
    final syncRespository = ref.read(productSyncRepositoryProvider);
    _addProduct = AddProduct(productRepository);
    _updateProduct = UpdateProduct(productRepository);
    _deleteProduct = DeleteProduct(productRepository);
    _getAllProducts = GetAllProducts(productRepository);
    _getSyncProducts = GetAllProducts(syncRespository);
    _getProductById = GetProductById(productRepository);
    _syncProducts = SyncProducts(syncRespository);
    unawaited(fetchProducts());
    return const ProductState();
  }

  Future<void> fetchProducts() async {
    final isConnected = await ref.read(networkInfoProvider).isConnected;
    final context = _buildActionContext();
    await FetchProductsCommand(
      context: context,
      getAllProducts: isConnected ? _getAllProducts : _getSyncProducts,
      paginationData: _paginationData,
      updatePagination: (data) => _paginationData = data,
    ).execute();
  }

  Future<void> addProduct(AddProductParams addProductParams) async {
    final context = _buildActionContext();
    await AddProductCommand(
      context: context,
      addProduct: _addProduct,
      params: addProductParams,
    ).execute();
  }

  Future<void> updateProduct(UpdateProductParams updateProductParams) async {
    final context = _buildActionContext();
    await UpdateProductCommand(
      context: context,
      updateProduct: _updateProduct,
      params: updateProductParams,
    ).execute();
  }

  Future<void> getProductById(GetProductByIdParams getProductByIdParams) async {
    final context = _buildActionContext();
    await GetProductByIdCommand(
      context: context,
      getProductById: _getProductById,
      params: getProductByIdParams,
    ).execute();
  }

  Future<void> deleteProduct(DeleteProductParams deleteProductParams) async {
    final context = _buildActionContext();
    await DeleteProductCommand(
      context: context,
      deleteProduct: _deleteProduct,
      params: deleteProductParams,
    ).execute();
  }

  void syncProducts() {
    final products = state.products;
    unawaited(
      SyncProductsCommand(products: products, syncProducts: _syncProducts)
          .execute(),
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
