// ignore_for_file: unused_import
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/api_response/api_response_extensions.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_all_{{name.snakeCase()}}s.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';

class Fetch{{name.pascalCase()}}sCommand {
  Fetch{{name.pascalCase()}}sCommand({
    required this.context,
    required this.getAll{{name.pascalCase()}}s,
    required this.paginationData,
    required this.updatePagination,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final GetAll{{name.pascalCase()}}s getAll{{name.pascalCase()}}s;
  final Page<List<{{name.pascalCase()}}>>? paginationData;
  final void Function(Page<List<{{name.pascalCase()}}>>) updatePagination;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentItems = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s),
    );

    final result = await getAll{{name.pascalCase()}}s(
      GetAll{{name.pascalCase()}}Params(
        paginationPageIndex: paginationData?.getNextPageIndex() ?? 1,
      ),
    );
    result.when(
      success: (page) {
        updatePagination(page);
        final isFirstPage = page.currentPage == 1;
        final newItems = isFirstPage ? page.child : [...currentItems, ...page.child];
        final successState = currentState.withSuccess(
          {{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s,
          items: newItems,
        );
        context.onNewState(successState);
      },
      failure: (failure) {
        final message = failure.message;
        final errorState = currentState.withError(
          {{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s,
          message,
        );
        context.onNewState(errorState);
      },
    );
  }
}


