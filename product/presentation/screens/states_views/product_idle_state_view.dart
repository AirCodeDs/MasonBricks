// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';

class ProductIdleView extends StatelessWidget {
  const ProductIdleView({required this.state, required this.ref, super.key});
  final ProductState state;
  final Ref ref;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
