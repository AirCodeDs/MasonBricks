// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';

class ProductErrorView extends StatelessWidget {
  const ProductErrorView({required this.state, required this.ref, super.key});
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
