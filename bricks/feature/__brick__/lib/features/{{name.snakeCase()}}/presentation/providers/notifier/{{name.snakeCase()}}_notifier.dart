// Package imports:
// ignore_for_file: unused_import

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_core_kit/app_core_kit.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/add_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/delete_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/fetch_{{name.snakeCase()}}s_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/get_{{name.snakeCase()}}_by_id_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/sync_{{name.snakeCase()}}s_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/commands/update_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/notifier_context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/add_{{name.snakeCase()}}_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/delete_{{name.snakeCase()}}_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/get_all_{{name.snakeCase()}}s_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/get_{{name.snakeCase()}}_by_id_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/sync_{{name.snakeCase()}}s_provider.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/providers/use_cases/update_{{name.snakeCase()}}_provider.dart';

// Project imports:

part '{{name.snakeCase()}}_notifier.g.dart';

@riverpod
class {{name.pascalCase()}}Notifier extends _${{name.pascalCase()}}Notifier {
  Page<List<{{name.snakeCase()}}>>? _paginationData;

  @override
  {{name.pascalCase()}}State build() {
    unawaited(fetch{{name.pascalCase()}}s());
    return const {{name.pascalCase()}}State();
  }

  Future<void> fetch{{name.pascalCase()}}s() async {
    final isConnected = await ref.read(networkInfoProvider).isConnected;
    final context = _buildActionContext();
    final getAll{{name.pascalCase()}}s = isConnected
        ? ref.read(getAll{{name.pascalCase()}}sProvider)
        : ref.read(getAllSync{{name.pascalCase()}}sProvider);

    await fetch{{name.pascalCase()}}sCommand(
      context: context,
      GetAll{{name.pascalCase()}}s: getAll{{name.pascalCase()}}s,
      paginationData: _paginationData,
      updatePagination: (data) => _paginationData = data,
    ).execute();
  }

  Future<void> Add{{name.pascalCase()}}(Add{{name.pascalCase()}}Params Add{{name.pascalCase()}}Params) async {
    final context = _buildActionContext();
    final Add{{name.pascalCase()}}UseCase = ref.read(Add{{name.pascalCase()}}Provider);

    await Add{{name.pascalCase()}}Command(
      context: context,
      Add{{name.pascalCase()}}: Add{{name.pascalCase()}}UseCase,
      params: Add{{name.pascalCase()}}Params,
    ).execute();
  }

  Future<void> Update{{name.pascalCase()}}(Update{{name.pascalCase()}}Params Update{{name.pascalCase()}}Params) async {
    final context = _buildActionContext();
    final Update{{name.pascalCase()}}UseCase = ref.read(Update{{name.pascalCase()}}Provider);

    await Update{{name.pascalCase()}}Command(
      context: context,
      Update{{name.pascalCase()}}: Update{{name.pascalCase()}}UseCase,
      params: Update{{name.pascalCase()}}Params,
    ).execute();
  }

  Future<void> Get{{name.pascalCase()}}ById(Get{{name.pascalCase()}}ByIdParams Get{{name.pascalCase()}}ByIdParams) async {
    final context = _buildActionContext();
    final Get{{name.pascalCase()}}ByIdUseCase = ref.read(Get{{name.pascalCase()}}ByIdProvider);

    await Get{{name.pascalCase()}}ByIdCommand(
      context: context,
      Get{{name.pascalCase()}}ById: Get{{name.pascalCase()}}ByIdUseCase,
      params: Get{{name.pascalCase()}}ByIdParams,
    ).execute();
  }

  Future<void> Delete{{name.pascalCase()}}(Delete{{name.pascalCase()}}Params Delete{{name.pascalCase()}}Params) async {
    final context = _buildActionContext();
    final Delete{{name.pascalCase()}}UseCase = ref.read(Delete{{name.pascalCase()}}Provider);

    await Delete{{name.pascalCase()}}Command(
      context: context,
      Delete{{name.pascalCase()}}: Delete{{name.pascalCase()}}UseCase,
      params: Delete{{name.pascalCase()}}Params,
    ).execute();
  }

  void Sync{{name.pascalCase()}}s() {
    final {{name.snakeCase()}}s = state.{{name.snakeCase()}}s;
    final Sync{{name.pascalCase()}}sUseCase = ref.read(Sync{{name.pascalCase()}}sProvider);

    unawaited(
      Sync{{name.pascalCase()}}sCommand(
        {{name.snakeCase()}}s: {{name.snakeCase()}}s,
        Sync{{name.pascalCase()}}s: Sync{{name.pascalCase()}}sUseCase,
      ).execute(),
    );
  }

  void clearState() {
    _paginationData = null;
    state = const {{name.pascalCase()}}State();
  }

  {{name.pascalCase()}}NotifierContext _buildActionContext() => {{name.pascalCase()}}NotifierContext(
    currentState: state,
    ref: ref,
    onNewState: (newState) async {
      state = newState;
      final isConnected = await ref.read(networkInfoProvider).isConnected;

      if (isConnected) {
        Sync{{name.pascalCase()}}s();
      }
    },
  );
}
