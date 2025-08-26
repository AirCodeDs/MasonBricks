// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_services/app_services.dart';
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:hbh_connect/features/product/application/state/product_state.dart';
import 'package:hbh_connect/features/product/application/state/product_state_extension.dart';
import 'package:hbh_connect/features/product/providers/use_cases/delete_product_provider.dart';
import 'package:hbh_connect/features/product/providers/use_cases/update_product_provider.dart';
import 'package:hbh_connect/features/product/presentation/providers/notifier/product_notifier.dart';

import 'package:hbh_connect/features/product/presentation/screens/states_views/util.dart'
    as state_util;

class SuccessProductView extends StatelessWidget {
  const SuccessProductView({required this.state, required this.ref, super.key});
  final ProductState state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => Expanded(
    child: ListView.separated(
      itemCount: state.products.length,
      separatorBuilder: (context, index) =>
          Column(children: [Gap(20.h), const Divider(), Gap(20.h)]),
      itemBuilder: (context, index) {
        final product = state.products[index];
        return SpacedColumn(
          spacing: 10.sp,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.title(state_util.capitalizeFirstLetter(product.name)),
                Row(
                  children: [
                    const Icon(Icons.monetization_on),
                    AppText(
                      '${product.price}',
                    ).padding(paddingX: 3.w, paddingY: 2.h),
                  ],
                ),
              ],
            ),
            Row(children: [AppText(product.description)]),
            Row(
              spacing: 15.w,
              children: [
                AppButton.primary(
                  width: 130.w,
                  height: 45.h,
                  onPressed: () async {
                    final jsonParams = state_util.generateFakeProduct();
                    final params = UpdateProductParams(
                      id: product.id,
                      name: jsonParams['name'].toString(),
                      description: jsonParams['description'].toString(),
                      category: jsonParams['category'].toString(),
                      price: jsonParams['price'] as double,
                    );
                    await ref
                        .read(productNotifierProvider.notifier)
                        .updateProduct(params);

                    if (state.isSuccessUpdateProduct) {
                      AppToastService.success('product updated successfully');
                    } else if (state.isErrorUpdateProduct) {
                      AppToastService.error('failed to update product');
                    }
                  },
                  text: 'Update',
                  context: context,
                ),
                AppButton.neutralOncard(
                  width: 130.w,
                  height: 45.h,
                  onPressed: () async {
                    final params = DeleteProductParams(id: product.id);
                    await ref
                        .read(productNotifierProvider.notifier)
                        .deleteProduct(params);
                    if (state.isSuccessDeleteProduct) {
                      AppToastService.success('product deleted successfully');
                    } else if (state.isErrorDeleteProduct) {
                      AppToastService.error('failed to delete product');
                    }
                  },
                  text: 'Delete',
                  context: context,
                ),
              ],
            ),
          ],
        ).padding();
      },
    ),
  );
}
