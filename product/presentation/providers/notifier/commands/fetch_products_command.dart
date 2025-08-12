// ignore_for_file: unused_import
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/api_response/api_response_extensions.dart';
import 'package:urban_transport/core/models/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/product/application/use_cases/get_all_products.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/context/product_notifier_context.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';

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
        final newItems =
            isFirstPage ? page.child : [...currentProducts, ...page.child];
        final successState = currentState.withSuccess(
          ProductOperation.fetchProducts,
          products: newItems,
        );
        context.onNewState(successState);
      },
      failure: (failure) {
        final message = failure.message;
        final errorState = currentState.withError(
          ProductOperation.fetchProducts,
          message,
        );
        context.onNewState(errorState);
      },
    );
  }
}
