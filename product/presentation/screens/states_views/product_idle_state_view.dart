import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';

class ProductIdleView extends StatelessWidget {
  const ProductIdleView({
    required this.state,
    required this.ref,
    super.key,
  });
  final ProductState state;
  final Ref ref;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
