// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_product_by_id.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class Get{{name.pascalCase()}}ByIdCommand {
  Get{{name.pascalCase()}}ByIdCommand({
    required this.context,
    required this.Get{{name.pascalCase()}}ById,
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Get{{name.pascalCase()}}ById Get{{name.pascalCase()}}ById;
  final Get{{name.pascalCase()}}ByIdParams params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.Get{{name.pascalCase()}}ById),
    );

    final result = await Get{{name.pascalCase()}}ById(params);
    result.when(
      success: ({{name.snakeCase()}}) {
        final index = currentProducts.indexWhere(
          (item) => item.id == params.urlParams.first,
        );

        final updatedItems = List<{{name.snakeCase()}}>.from(currentProducts);
        if (index != -1) {
          updatedItems[index] = {{name.snakeCase()}};
        } else {
          updatedItems.add({{name.snakeCase()}});
        }

        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.Get{{name.pascalCase()}}ById,
            {{name.snakeCase()}}s: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.Get{{name.pascalCase()}}ById,
            failure.message,
          ),
        );
      },
    );
  }
}
