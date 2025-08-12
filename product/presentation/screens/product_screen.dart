// refactored_adaptive_product_screen.dart

import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:urban_transport/features/product/Application/use_cases/add_product.dart';
import 'package:urban_transport/features/product/presentation/providers/notifier/product_notifier.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state_extension.dart';
import 'package:urban_transport/features/product/presentation/screens/states_views/product_empty_view.dart';
import 'package:urban_transport/features/product/presentation/screens/states_views/product_view.dart';
import 'package:urban_transport/features/product/presentation/screens/states_views/product_loading_view.dart';
import 'package:urban_transport/features/product/presentation/screens/widgets/product_list_view.dart';
import 'package:urban_transport/features/product/presentation/screens/states_views/util.dart';

class AdaptiveProductScreen extends StatelessWidget {
  const AdaptiveProductScreen({super.key});

  @override
  Widget build(BuildContext context) => AdaptivePlatformUI.scaffold(
        useSafeArea: false,
        body: const _ProductScreenBody(),
      );
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildHeader(context),
          Consumer(
            builder: (context, ref, _) {
              final productState = ref.watch(productNotifierProvider);
              return _buildStateContent(context, ref, productState);
            },
          ),
        ],
      );

  Widget _buildStateContent(
    BuildContext context,
    WidgetRef ref,
    ProductState state,
  ) {
    if (state.isLoadingFetchProducts) {
      return ProductLoadingView(state: state);
    }

    if (state.isSuccessFetchProducts) {
      return state.isProductsEmpty
          ? EmptyProductView(state: state)
          : ProductListView(state: state, ref: ref);
    }

    if (state.isErrorFetchProducts) {
      return ProductErrorView(state: state, ref: ref);
    }

    return const SizedBox();
  }

  DecoratedBox _buildHeader(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(color: context.cardColor),
        child: Column(
          children: [
            Gap(45.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final productNotifier =
                        ref.read(productNotifierProvider.notifier);
                    return IconButton(
                      onPressed: () async {
                        await productNotifier.fetchProducts();
                      },
                      icon: const Icon(Icons.refresh),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) => IconButton(
                    onPressed: () async {
                      final jsonParams = generateFakeProduct();
                      final params = AddProductParams(
                        name: jsonParams['name'].toString(),
                        description: jsonParams['description'].toString(),
                        category: jsonParams['category'].toString(),
                        price: jsonParams['price'] as double,
                      );
                      await ref
                          .read(productNotifierProvider.notifier)
                          .addProduct(params);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ).padding(),
          ],
        ),
      );
}
