// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/notifier_context/product_notifier_context.dart';
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/application/use_cases/update_product.dart';

class UpdateProductCommand {
  UpdateProductCommand({
    required this.context,
    required this.updateProduct,
    required this.params,
  });

  final ProductNotifierContext context;
  final UpdateProduct updateProduct;
  final UpdateProductParams params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.products;

    context.onNewState(
      currentState.withLoading(ProductOperation.updateProduct),
    );

    final result = await updateProduct(params);
    result.when(
      success: (updatedProduct) {
        final updatedItems = currentProducts
            .map(
              (item) =>
                  item.id == params.urlParams.first ? updatedProduct : item,
            )
            .toList();
        context.onNewState(
          currentState.withSuccess(
            ProductOperation.updateProduct,
            products: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            ProductOperation.updateProduct,
            failure.message,
          ),
        );
      },
    );
  }
}
