// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart';

class Add{{name.pascalCase()}}Command {
  Add{{name.pascalCase()}}Command({
    required this.context,
    required this.add{{name.pascalCase()}},
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Add{{name.pascalCase()}} add{{name.pascalCase()}};
  final Add{{name.pascalCase()}}Params params;

  Future<void> execute() async {
    final currentState = context.currentState;

    context.onNewState(currentState.withLoading({{name.pascalCase()}}Operation.add{{name.pascalCase()}}));

    final result = await add{{name.pascalCase()}}(params);
    result.when(
      success: ({{name.snakeCase()}}) {
        final new{{name.pascalCase()}}s = [{{name.snakeCase()}}, ...currentState.{{name.snakeCase()}}s];
        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.add{{name.pascalCase()}},
            items: new{{name.pascalCase()}}s,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError({{name.pascalCase()}}Operation.add{{name.pascalCase()}}, failure.message),
        );
      },
    );
  }
}
