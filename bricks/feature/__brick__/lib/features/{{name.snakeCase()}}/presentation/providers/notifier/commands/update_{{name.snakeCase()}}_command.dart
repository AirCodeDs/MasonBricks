import 'package:{{project_name}}/core/api_response/api_response_extensions.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/update_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';

class Update{{name.pascalCase()}}Command {
  Update{{name.pascalCase()}}Command({
    required this.context,
    required this.update{{name.pascalCase()}},
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Update{{name.pascalCase()}} update{{name.pascalCase()}};
  final Update{{name.pascalCase()}}Params params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentItems = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.update{{name.pascalCase()}}),
    );

    final result = await update{{name.pascalCase()}}(params);
    result.when(
      success: (updatedItem) {
        final updatedItems = currentItems
            .map(
              (item) => item.id == params.urlParams.first ? updatedItem : item,
            )
            .toList();

        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.update{{name.pascalCase()}},
            items: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.update{{name.pascalCase()}},
            failure.message,
          ),
        );
      },
    );
  }
}


