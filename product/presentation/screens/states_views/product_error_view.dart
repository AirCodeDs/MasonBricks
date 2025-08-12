import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';

class ProductErrorView extends StatelessWidget {
  const ProductErrorView({
    required this.state,
    required this.ref,
    super.key,
  });
  final ProductState state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: AppText(
            state.errorFetchProducts.toString(),
            textAlign: TextAlign.center,
          ).padding(),
        ),
      );
}
