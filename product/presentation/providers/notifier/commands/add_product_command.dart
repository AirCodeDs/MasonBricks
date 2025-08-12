import 'package:urban_transport/core/api_response/api_response_extensions.dart';
import 'package:urban_transport/features/product/Application/use_cases/add_product.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/context/product_notifier_context.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';

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

    context.onNewState(
      currentState.withLoading(ProductOperation.addProduct),
    );

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
          currentState.withError(
            ProductOperation.addProduct,
            failure.message,
          ),
        );
      },
    );
  }
}
