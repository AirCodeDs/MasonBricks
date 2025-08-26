// ignore_for_file: unused_import

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/get_all_products.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class fetch{{name.pascalCase()}}sCommand {
  fetch{{name.pascalCase()}}sCommand({
    required this.context,
    required this.GetAll{{name.pascalCase()}}s,
    required this.paginationData,
    required this.updatePagination,
  });

  final {{name.pascalCase()}}NotifierContext context;
  final GetAll{{name.pascalCase()}}s GetAll{{name.pascalCase()}}s;
  final Page<List<{{name.snakeCase()}}>>? paginationData;
  final void Function(Page<List<{{name.snakeCase()}}>>) updatePagination;

  Future<void> execute() async {
    final currentState = context.currentState;
    final currentProducts = currentState.{{name.snakeCase()}}s;

    context.onNewState(
      currentState.withLoading({{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s),
    );

    final result = await GetAll{{name.pascalCase()}}s(
      GetAllProductParams(
        paginationPageIndex: paginationData?.getNextPageIndex() ?? 1,
      ),
    );
    result.when(
      success: (page) {
        updatePagination(page);
        final isFirstPage = page.currentPage == 1;
        final newItems = isFirstPage
            ? page.child
            : [...currentProducts, ...page.child];
        final successState = currentState.withSuccess(
          {{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s,
          {{name.snakeCase()}}s: newItems,
        );
        context.onNewState(successState);
      },
      failure: (failure) {
        final errorState = currentState.withError(
          {{name.pascalCase()}}Operation.fetch{{name.pascalCase()}}s,
          failure.message,
        );
        context.onNewState(errorState);
      },
    );
  }
}
