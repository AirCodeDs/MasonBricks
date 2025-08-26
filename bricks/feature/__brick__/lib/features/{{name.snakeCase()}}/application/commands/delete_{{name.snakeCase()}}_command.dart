// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/delete_product.dart';

class Delete{{name.pascalCase()}}Command {
  Delete{{name.pascalCase()}}Command({
    required this.context,
    required this.Delete{{name.pascalCase()}},
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Delete{{name.pascalCase()}} Delete{{name.pascalCase()}};
  final Delete{{name.pascalCase()}}Params params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.Delete{{name.pascalCase()}}),
    );

    final result = await Delete{{name.pascalCase()}}(params);
    result.when(
      success: (_) {
        final updatedItems = currentProducts
            .where((item) => item.id != params.urlParams.first)
            .toList();

        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.Delete{{name.pascalCase()}},
            {{name.snakeCase()}}s: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.Delete{{name.pascalCase()}},
            failure.message,
          ),
        );
      },
    );
  }
}
