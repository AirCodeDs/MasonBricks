// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}SuccessView extends StatelessWidget {
  const {{name.pascalCase()}}SuccessView({required this.state, super.key});
  final {{name.pascalCase()}}State state;

  @override
  Widget build(BuildContext context) => const Expanded(
    child: Center(
      child: Text(
        'Success State',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    ),
  );
}
