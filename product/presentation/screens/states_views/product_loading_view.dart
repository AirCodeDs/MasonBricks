import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:urban_transport/features/product/presentation/providers/state/product_state.dart';
import 'package:urban_transport/widgets/spaced_widgets/spaced_column.dart';

class ProductLoadingView extends StatelessWidget {
  const ProductLoadingView({required this.state, super.key});
  final ProductState state;

  @override
  Widget build(BuildContext context) => SpacedColumn(
        spacing: 25.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...[1, 2, 3].map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
                ShimmerContainer(width: 200.w, height: 15.h),
                Gap(5.h),
                SpacedColumn(
                  spacing: 5.h,
                  children: [
                    ShimmerContainer(width: 300.w, height: 3.h),
                    ShimmerContainer(width: 300.w, height: 3.h),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
