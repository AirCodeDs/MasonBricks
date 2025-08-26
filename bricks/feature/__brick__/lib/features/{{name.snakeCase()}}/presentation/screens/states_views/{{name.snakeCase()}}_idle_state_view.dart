// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class ProductIdleView extends StatelessWidget {
  const ProductIdleView({required this.state, required this.ref, super.key});
  final {{name.pascalCase()}}State state;
  final Ref ref;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
