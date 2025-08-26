// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}NotifierContext {
  {{name.pascalCase()}}NotifierContext({
    required this.currentState,
    required this.ref,
    required this.onNewState,
  });
  final {{name.pascalCase()}}State currentState;
  final Ref ref;
  final void Function({{name.pascalCase()}}State) onNewState;
}
