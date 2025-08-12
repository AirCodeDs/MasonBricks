import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/{{name.snakeCase()}}_notifier.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_empty_view.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_error_view.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/states_views/{{name.snakeCase()}}_loading_view.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/widgets/{{name.snakeCase()}}_list_view.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/screens/states_views/util.dart';

class Adaptive{{name.pascalCase()}}Screen extends StatelessWidget {
  const Adaptive{{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => AdaptivePlatformUI.scaffold(
        useSafeArea: false,
        body: const _{{name.pascalCase()}}ScreenBody(),
      );
}

class _{{name.pascalCase()}}ScreenBody extends StatelessWidget {
  const _{{name.pascalCase()}}ScreenBody();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildHeader(context),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch({{name.camelCase()}}NotifierProvider);
              return _buildStateContent(context, ref, state);
            },
          ),
        ],
      );

  Widget _buildStateContent(
    BuildContext context,
    WidgetRef ref,
    {{name.pascalCase()}}State state,
  ) {
    if (state.isLoadingFetch{{name.pascalCase()}}s) {
      return {{name.pascalCase()}}LoadingView(state: state);
    }

    if (state.isSuccessFetch{{name.pascalCase()}}s) {
      return state.isItemsEmpty
          ? Empty{{name.pascalCase()}}View(state: state)
          : {{name.pascalCase()}}ListView(state: state, ref: ref);
    }

    if (state.isErrorFetch{{name.pascalCase()}}s) {
      return {{name.pascalCase()}}ErrorView(state: state, ref: ref);
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
                    final notifier = ref.read({{name.camelCase()}}NotifierProvider.notifier);
                    return IconButton(
                      onPressed: () async {
                        await notifier.fetch{{name.pascalCase()}}s();
                      },
                      icon: const Icon(Icons.refresh),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) => IconButton(
                    onPressed: () async {
                      final jsonParams = generateFake{{name.pascalCase()}}();
                      final params = Add{{name.pascalCase()}}Params(
                        name: jsonParams['name'].toString(),
                        description: jsonParams['description'].toString(),
                        category: jsonParams['category'].toString(),
                        price: jsonParams['price'] as double,
                      );
                      await ref
                          .read({{name.camelCase()}}NotifierProvider.notifier)
                          .add{{name.pascalCase()}}(params);
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

//STATEFUL VERSION
// class Adaptive{{name.pascalCase()}}Screen extends StatefulWidget {
//   const Adaptive{{name.pascalCase()}}Screen({super.key});

//   @override
//   State<Adaptive{{name.pascalCase()}}Screen> createState() => _Adaptive{{name.pascalCase()}}ScreenState();
// }

// class _Adaptive{{name.pascalCase()}}ScreenState extends State<Adaptive{{name.pascalCase()}}Screen> {
//   @override
//   Widget build(BuildContext context) => AdaptivePlatformUI.scaffold(
//         body: const _{{name.pascalCase()}}ScreenBody(),
//       );
// }

// class _{{name.pascalCase()}}ScreenBody extends ConsumerStatefulWidget {
//   const _{{name.pascalCase()}}ScreenBody();

//   @override
//   ConsumerState<_{{name.pascalCase()}}ScreenBody> createState() => _{{name.pascalCase()}}ScreenBodyState();
// }

// class _{{name.pascalCase()}}ScreenBodyState extends ConsumerState<_{{name.pascalCase()}}ScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     // Exemple : final someData = ref.watch(someProvider);

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         AppText(
//           'Your Content',
//           fontSize: 14.sp,
//         ),
//       ],
//     );
//   }
// }
