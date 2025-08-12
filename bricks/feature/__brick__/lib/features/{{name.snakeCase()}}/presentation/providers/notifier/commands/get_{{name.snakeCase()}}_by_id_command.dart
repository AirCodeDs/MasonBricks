import 'package:{{project_name}}/core/api_response/api_response_extensions.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_{{name.snakeCase()}}_by_id.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';

class Get{{name.pascalCase()}}ByIdCommand {
  Get{{name.pascalCase()}}ByIdCommand({
    required this.context,
    required this.get{{name.pascalCase()}}ById,
    required this.params,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final Get{{name.pascalCase()}}ById get{{name.pascalCase()}}ById;
  final Get{{name.pascalCase()}}ByIdParams params;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentItems = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById),
    );

    final result = await get{{name.pascalCase()}}ById(params);
    result.when(
      success: (item) {
        final index = currentItems.indexWhere(
          (el) => el.id == params.urlParams.first,
        );

        final updatedItems = List<{{name.pascalCase()}}>.from(currentItems);
        if (index != -1) {
          updatedItems[index] = item;
        } else {
          updatedItems.add(item);
        }

        context.onNewState(
          currentState.withSuccess(
            {{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById,
            items: updatedItems,
          ),
        );
      },
      failure: (failure) {
        context.onNewState(
          currentState.withError(
            {{name.pascalCase()}}Operation.get{{name.pascalCase()}}ById,
            failure.message,
          ),
        );
      },
    );
  }
}


