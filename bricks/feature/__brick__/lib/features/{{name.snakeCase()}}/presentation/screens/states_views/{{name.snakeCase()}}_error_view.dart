// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_widgets_kit/app_widgets_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';

class {{name.pascalCase()}}ErrorView extends StatelessWidget {
  const {{name.pascalCase()}}ErrorView({
    required this.state,
    required this.ref,
    super.key,
  });
  final {{name.pascalCase()}}State state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: AppText(
            state.errorFetch{{name.pascalCase()}}s.toString(),
            textAlign: TextAlign.center,
          ).padding(),
        ),
      );
}


