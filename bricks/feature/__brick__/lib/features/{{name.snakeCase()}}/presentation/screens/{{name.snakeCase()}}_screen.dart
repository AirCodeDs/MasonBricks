// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:app_ui/app_ui.dart';

class Adaptive{{name.pascalCase()}}Screen extends StatelessWidget {
  const Adaptive{{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePlatformUI.scaffold(
      body: const _{{name.pascalCase()}}ScreenBody(),
    );
  }
}

class _{{name.pascalCase()}}ScreenBody extends ConsumerWidget {
  const _{{name.pascalCase()}}ScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ici, tu peux surveiller tes providers Riverpod.
    // Exemple : final someData = ref.watch(someProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         AppText(
            'Your Content',
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
