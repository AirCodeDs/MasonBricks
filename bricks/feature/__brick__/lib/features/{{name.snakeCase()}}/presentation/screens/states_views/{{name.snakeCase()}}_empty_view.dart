import 'package:flutter/material.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class Empty{{name.pascalCase()}}View extends StatelessWidget {
  const Empty{{name.pascalCase()}}View({required this.state, super.key});
  final {{name.pascalCase()}}State state;

  @override
  Widget build(BuildContext context) => const Expanded(
        child: Center(
          child: Text(
            '{{name.pascalCase()}} list is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      );
}


