// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({required this.state, super.key});
  final ProductState state;

  @override
  Widget build(BuildContext context) => const Expanded(
    child: Center(
      child: Text(
        'Product list is empty',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
