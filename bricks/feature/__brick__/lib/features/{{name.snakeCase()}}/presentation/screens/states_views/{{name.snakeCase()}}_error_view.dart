import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';

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


