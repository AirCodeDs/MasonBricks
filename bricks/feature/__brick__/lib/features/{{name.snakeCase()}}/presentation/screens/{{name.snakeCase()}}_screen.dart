// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adaptive{{name.pascalCase()}}Screen extends StatelessWidget {
  const Adaptive{{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) =>
      AdaptivePlatformUI.scaffold(body: const _{{name.pascalCase()}}ScreenBody());
}

class _{{name.pascalCase()}}ScreenBody extends ConsumerWidget {
  const _{{name.pascalCase()}}ScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ici, tu peux surveiller tes providers Riverpod.
    // Exemple : final someData = ref.watch(someProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [AppText('Your Content', fontSize: 14.sp)],
    );
  }
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
