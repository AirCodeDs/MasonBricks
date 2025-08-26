// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/update_product.dart';

class Update{{name.pascalCase()}}Command {
  Update{{name.pascalCase()}}Command({
    required this.context,
    required this.Update{{name.pascalCase()}},
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Update{{name.pascalCase()}} Update{{name.pascalCase()}};
  final Update{{name.pascalCase()}}Params params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.Update{{name.pascalCase()}}),
    );

    final result = await Update{{name.pascalCase()}}(params);
    result.when(
      success: (updatedProduct) {
        final updatedItems = currentProducts
            .map(
              (item) =>
                  item.id == params.urlParams.first ? updatedProduct : item,
            )
            .toList();
        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.Update{{name.pascalCase()}},
            {{name.snakeCase()}}s: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.Update{{name.pascalCase()}},
            failure.message,
          ),
        );
      },
    );
  }
}
