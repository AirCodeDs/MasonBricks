// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_services/app_services.dart';
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/delete_{{name.snakeCase()}}_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/update_{{name.snakeCase()}}_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/providers/notifier/{{name.snakeCase()}}_notifier.dart';

import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/states_views/util.dart'
    as state_util;

class SuccessProductView extends StatelessWidget {
  const SuccessProductView({required this.state, required this.ref, super.key});
  final {{name.pascalCase()}}State state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => Expanded(
    child: ListView.separated(
      itemCount: state.{{name.snakeCase()}}s.length,
      separatorBuilder: (context, index) =>
          Column(children: [Gap(20.h), const Divider(), Gap(20.h)]),
      itemBuilder: (context, index) {
        final {{name.snakeCase()}} = state.{{name.snakeCase()}}s[index];
        return SpacedColumn(
          spacing: 10.sp,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.title(state_util.capitalizeFirstLetter({{name.snakeCase()}}.name)),
                Row(
                  children: [
                    const Icon(Icons.monetization_on),
                    AppText(
                      '${{{name.snakeCase()}}.price}',
                    ).padding(paddingX: 3.w, paddingY: 2.h),
                  ],
                ),
              ],
            ),
            Row(children: [AppText({{name.snakeCase()}}.description)]),
            Row(
              spacing: 15.w,
              children: [
                AppButton.primary(
                  width: 130.w,
                  height: 45.h,
                  onPressed: () async {
                    final jsonParams = state_util.generateFakeProduct();
                    final params = Update{{name.pascalCase()}}Params(
                      id: {{name.snakeCase()}}.id,
                      name: jsonParams['name'].toString(),
                      description: jsonParams['description'].toString(),
                      category: jsonParams['category'].toString(),
                      price: jsonParams['price'] as double,
                    );
                    await ref
                        .read({{name.pascalCase()}}NotifierProvider.notifier)
                        .Update{{name.pascalCase()}}(params);

                    if (state.isSuccessUpdate{{name.pascalCase()}}) {
                      AppToastService.success('{{name.snakeCase()}} updated successfully');
                    } else if (state.isErrorUpdate{{name.pascalCase()}}) {
                      AppToastService.error('failed to update {{name.snakeCase()}}');
                    }
                  },
                  text: 'Update',
                  context: context,
                ),
                AppButton.neutralOncard(
                  width: 130.w,
                  height: 45.h,
                  onPressed: () async {
                    final params = Delete{{name.pascalCase()}}Params(id: {{name.snakeCase()}}.id);
                    await ref
                        .read({{name.pascalCase()}}NotifierProvider.notifier)
                        .Delete{{name.pascalCase()}}(params);
                    if (state.isSuccessDelete{{name.pascalCase()}}) {
                      AppToastService.success('{{name.snakeCase()}} deleted successfully');
                    } else if (state.isErrorDelete{{name.pascalCase()}}) {
                      AppToastService.error('failed to delete {{name.snakeCase()}}');
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
