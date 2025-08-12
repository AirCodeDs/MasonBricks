import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';

class ProductNotifierContext {
  ProductNotifierContext({
    required this.currentState,
    required this.ref,
    required this.onNewState,
  });
  final ProductState currentState;
  final Ref ref;
  final void Function(ProductState) onNewState;
}
