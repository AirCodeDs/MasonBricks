import 'package:{{project_name}}/core/api_response/api_response_extensions.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';

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

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.add{{name.pascalCase()}}),
    );

    final result = await add{{name.pascalCase()}}(params);
    result.when(
      success: (item) {
        final newItems = [item, ...currentState.{{name.snakeCase()}}s];
        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.add{{name.pascalCase()}},
            items: newItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.add{{name.pascalCase()}},
            failure.message,
          ),
        );
      },
    );
  }
}



