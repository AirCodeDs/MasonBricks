import 'package:urban_transport/core/api_response/api_response_extensions.dart';
import 'package:urban_transport/features/product/Application/use_cases/get_product_by_id.dart';
import 'package:urban_transport/features/product/domain/entities/product.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/context/product_notifier_context.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';

class GetProductByIdCommand {
  GetProductByIdCommand({
    required this.context,
    required this.getProductById,
    required this.params,
  });

  final ProductNotifierContext context;
  final GetProductById getProductById;
  final GetProductByIdParams params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.products;

    context.onNewState(
      currentState.withLoading(ProductOperation.getProductById),
    );

    final result = await getProductById(params);
    result.when(
      success: (product) {
        final index = currentProducts.indexWhere(
          (item) => item.id == params.urlParams.first,
        );

        final updatedItems = List<Product>.from(currentProducts);
        if (index != -1) {
          updatedItems[index] = product;
        } else {
          updatedItems.add(product);
        }

        context.onNewState(
          currentState.withSuccess(
            ProductOperation.getProductById,
            products: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            ProductOperation.getProductById,
            failure.message,
          ),
        );
      },
    );
  }
}
