// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/notifier_context/product_notifier_context.dart';
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/application/use_cases/delete_product.dart';

class DeleteProductCommand {
  DeleteProductCommand({
    required this.context,
    required this.deleteProduct,
    required this.params,
  });

  final ProductNotifierContext context;
  final DeleteProduct deleteProduct;
  final DeleteProductParams params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.products;

    context.onNewState(
      currentState.withLoading(ProductOperation.deleteProduct),
    );

    final result = await deleteProduct(params);
    result.when(
      success: (_) {
        final updatedItems = currentProducts
            .where((item) => item.id != params.urlParams.first)
            .toList();

        context.onNewState(
          currentState.withSuccess(
            ProductOperation.deleteProduct,
            products: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            ProductOperation.deleteProduct,
            failure.message,
          ),
        );
      },
    );
  }
}
