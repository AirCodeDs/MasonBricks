// refactored_adaptive_product_screen.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/providers/notifier/{{name.snakeCase()}}_notifier.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/add_{{name.snakeCase()}}_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_empty_view.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_error_view.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_loading_view.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/states_views/util.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/screens/widgets/{{name.snakeCase()}}_list_view.dart';

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
          final {{name.pascalCase()}}State = ref.watch({{name.pascalCase()}}NotifierProvider);
          return _buildStateContent(context, ref, {{name.pascalCase()}}State);
        },
      ),
    ],
  );

  Widget _buildStateContent(
    BuildContext context,
    WidgetRef ref,
    {{name.pascalCase()}}State state,
  ) {
    if (state.isLoadingfetch{{name.pascalCase()}}s) {
      return ProductLoadingView(state: state);
    }

    if (state.isSuccessfetch{{name.pascalCase()}}s) {
      return state.isProductsEmpty
          ? EmptyProductView(state: state)
          : ProductListView(state: state, ref: ref);
    }

    if (state.isErrorfetch{{name.pascalCase()}}s) {
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
                final {{name.pascalCase()}}Notifier = ref.read(
                  {{name.pascalCase()}}NotifierProvider.notifier,
                );
                return IconButton(
                  onPressed: () async {
                    await {{name.pascalCase()}}Notifier.fetch{{name.pascalCase()}}s();
                  },
                  icon: const Icon(Icons.refresh),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) => IconButton(
                onPressed: () async {
                  final jsonParams = generateFakeProduct();
                  final params = Add{{name.pascalCase()}}Params(
                    name: jsonParams['name'].toString(),
                    description: jsonParams['description'].toString(),
                    category: jsonParams['category'].toString(),
                    price: jsonParams['price'] as double,
                  );
                  await ref
                      .read({{name.pascalCase()}}NotifierProvider.notifier)
                      .Add{{name.pascalCase()}}(params);
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
