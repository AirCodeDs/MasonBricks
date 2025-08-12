import 'package:{{project_name}}/core/api_response/api_response_extensions.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/delete_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';

class Delete{{name.pascalCase()}}Command {
  Delete{{name.pascalCase()}}Command({
    required this.context,
    required this.delete{{name.pascalCase()}},
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Delete{{name.pascalCase()}} delete{{name.pascalCase()}};
  final Delete{{name.pascalCase()}}Params params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentItems = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.delete{{name.pascalCase()}}),
    );

    final result = await delete{{name.pascalCase()}}(params);
    result.when(
      success: (_) {
        final updatedItems = currentItems
            .where((item) => item.id != params.urlParams.first)
            .toList();

        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.delete{{name.pascalCase()}},
            items: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.delete{{name.pascalCase()}},
            failure.message,
          ),
        );
      },
    );
  }
}


