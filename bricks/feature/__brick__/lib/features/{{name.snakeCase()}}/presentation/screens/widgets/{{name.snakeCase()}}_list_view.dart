import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:{{project_name}}/services/toast/app_toast_service.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/delete_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/update_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/{{name.snakeCase()}}_notifier.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/states_views/util.dart' as state_util;
import 'package:{{project_name}}/widgets/spaced_widgets/spaced_column.dart';

class {{name.pascalCase()}}ListView extends StatelessWidget {
  const {{name.pascalCase()}}ListView({
    required this.state,
    required this.ref,
    super.key,
  });
  final {{name.pascalCase()}}State state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.separated(
          itemCount: state.{{name.snakeCase()}}s.length,
          separatorBuilder: (context, index) => Column(
            children: [
              Gap(20.h),
              const Divider(),
              Gap(20.h),
            ],
          ),
          itemBuilder: (context, index) {
            final item = state.{{name.snakeCase()}}s[index];
            return SpacedColumn(
              spacing: 10.sp,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title(
                      state_util.capitalizeFirstLetter(item.name),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.monetization_on),
                        AppText('${item.price}').padding(
                          paddingX: 3.w,
                          paddingY: 2.h,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppText(item.description),
                  ],
                ),
                Row(
                  spacing: 15.w,
                  children: [
                    AppButton.primary(
                      width: 130.w,
                      height: 45.h,
                      onPressed: () async {
                        final jsonParams = state_util.generateFake{{name.pascalCase()}}();
                        final params = Update{{name.pascalCase()}}Params(
                          id: item.id,
                          name: jsonParams['name'].toString(),
                          description: jsonParams['description'].toString(),
                          category: jsonParams['category'].toString(),
                          price: jsonParams['price'] as double,
                        );
                        await ref
                            .read({{name.camelCase()}}NotifierProvider.notifier)
                            .update{{name.pascalCase()}}(params);

                        if (state.isSuccessUpdate{{name.pascalCase()}}) {
                          AppToastService.success(
                            '{{name.snakeCase()}} updated successfully',
                          );
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
                        final params = Delete{{name.pascalCase()}}Params(
                          id: item.id,
                        );
                        await ref
                            .read({{name.camelCase()}}NotifierProvider.notifier)
                            .delete{{name.pascalCase()}}(params);
                        if (state.isSuccessDelete{{name.pascalCase()}}) {
                          AppToastService.success(
                            '{{name.snakeCase()}} deleted successfully',
                          );
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


