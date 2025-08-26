// ignore_for_file: unused_import

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/notifier_context/product_notifier_context.dart';
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/application/use_cases/get_all_products.dart';
import 'package:hbh_connect/features/product/domain/entities/product.dart';

class FetchProductsCommand {
  FetchProductsCommand({
    required this.context,
    required this.getAllProducts,
    required this.paginationData,
    required this.updatePagination,
  });

  final ProductNotifierContext context;
  final GetAllProducts getAllProducts;
  final Page<List<Product>>? paginationData;
  final void Function(Page<List<Product>>) updatePagination;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.products;

    context.onNewState(
      currentState.withLoading(ProductOperation.fetchProducts),
    );

    final result = await getAllProducts(
      GetAllProductParams(
        paginationPageIndex: paginationData?.getNextPageIndex() ?? 1,
      ),
    );
    result.when(
      success: (page) {
        updatePagination(page);
        final isFirstPage = page.currentPage == 1;
        final newItems = isFirstPage
            ? page.child
            : [...currentProducts, ...page.child];
        final successState = currentState.withSuccess(
          ProductOperation.fetchProducts,
          products: newItems,
        );
        context.onNewState(successState);
      },
      failure: (failure) {
        final errorState = currentState.withError(
          ProductOperation.fetchProducts,
          failure.message,
        );
        context.onNewState(errorState);
      },
    );
  }
}
