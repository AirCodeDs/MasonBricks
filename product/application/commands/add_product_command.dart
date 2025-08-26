// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/notifier_context/product_notifier_context.dart';
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/application/use_cases/add_product.dart';

class AddProductCommand {
  AddProductCommand({
    required this.context,
    required this.addProduct,
    required this.params,
  });

  final ProductNotifierContext context;
  final AddProduct addProduct;
  final AddProductParams params;

  Future<void> execute() async {
    final currentState = context.currentState;

    context.onNewState(currentState.withLoading(ProductOperation.addProduct));

    final result = await addProduct(params);
    result.when(
      success: (product) {
        final newProducts = [product, ...currentState.products];
        context.onNewState(
          currentState.withSuccess(
            ProductOperation.addProduct,
            products: newProducts,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(ProductOperation.addProduct, failure.message),
        );
      },
    );
  }
}
