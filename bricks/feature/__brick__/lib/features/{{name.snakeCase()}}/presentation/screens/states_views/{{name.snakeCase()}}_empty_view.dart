// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({required this.state, super.key});
  final {{name.pascalCase()}}State state;

  @override
  Widget build(BuildContext context) => const Expanded(
    child: Center(
      child: Text(
        '{{name.snakeCase()}} list is empty',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
