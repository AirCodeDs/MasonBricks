// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';

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
