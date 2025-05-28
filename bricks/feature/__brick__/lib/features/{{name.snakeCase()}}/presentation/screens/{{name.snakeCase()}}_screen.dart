// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveProductScreen extends StatelessWidget {
  const AdaptiveProductScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      AdaptivePlatformUI.scaffold(body: const _ProductScreenBody());
}

class _ProductScreenBody extends ConsumerWidget {
  const _ProductScreenBody();

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
// class AdaptiveProductScreen extends StatefulWidget {
//   const AdaptiveProductScreen({super.key});

//   @override
//   State<AdaptiveProductScreen> createState() => _AdaptiveProductScreenState();
// }

// class _AdaptiveProductScreenState extends State<AdaptiveProductScreen> {
//   @override
//   Widget build(BuildContext context) => AdaptivePlatformUI.scaffold(
//         body: const _ProductScreenBody(),
//       );
// }

// class _ProductScreenBody extends ConsumerStatefulWidget {
//   const _ProductScreenBody();

//   @override
//   ConsumerState<_ProductScreenBody> createState() => _ProductScreenBodyState();
// }

// class _ProductScreenBodyState extends ConsumerState<_ProductScreenBody> {
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
