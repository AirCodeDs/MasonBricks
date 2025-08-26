// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class ProductLoadingView extends StatelessWidget {
  const ProductLoadingView({required this.state, super.key});
  final {{name.pascalCase()}}State state;

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
