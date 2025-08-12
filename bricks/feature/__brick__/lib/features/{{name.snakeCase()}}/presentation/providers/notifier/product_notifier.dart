// Package imports:
// ignore_for_file: unused_import

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name}}/core/providers/flavor/app_flavor_provider.dart';
import 'package:{{project_name}}/config/flavors/app_flavors.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/errors/failure_message_resolver.dart';
import 'package:{{project_name}}/core/models/metadata/pagination_data_model.dart';
import 'package:{{project_name}}/core/providers/network/network_info_provider.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state_extension.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_mock_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_remote_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_sync_repository_provider.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_sync_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/delete_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_all_{{name.snakeCase()}}s.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/get_{{name.snakeCase()}}_by_id.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/sync_{{name.snakeCase()}}s.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/application/use_cases/update_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/state/{{name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/commands/add_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/commands/update_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/commands/delete_{{name.snakeCase()}}_command.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/commands/get_{{name.snakeCase()}}_by_id_command.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/commands/fetch_{{name.snakeCase()}}s_command.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/providers/notifier/context/{{name.snakeCase()}}_notifier_context.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/repositories/{{name.snakeCase()}}_repository_provider.dart';

part '{{name.snakeCase()}}_notifier.g.dart';

@riverpod
class {{name.pascalCase()}}Notifier extends _${{name.pascalCase()}}Notifier {
  late final Add{{name.pascalCase()}} _add{{name.pascalCase()}};
  late final Update{{name.pascalCase()}} _update{{name.pascalCase()}};
  late final Delete{{name.pascalCase()}} _delete{{name.pascalCase()}};
  late final GetAll{{name.pascalCase()}}s _getAll{{name.pascalCase()}}s;
  late final Get{{name.pascalCase()}}ById _get{{name.pascalCase()}}ById;
  late final Sync{{name.pascalCase()}}s _sync{{name.pascalCase()}}s;
  late final GetAll{{name.pascalCase()}}s _getSync{{name.pascalCase()}}s;

  PaginationDataModel<List<{{name.pascalCase()}}>> _paginationData;

  @override
  {{name.pascalCase()}}State build() {
    final repository = ref.read({{name.camelCase()}}RepositoryProvider);
    final syncRespository = ref.read({{name.camelCase()}}SyncRepositoryProvider);
    _add{{name.pascalCase()}} = Add{{name.pascalCase()}}(repository);
    _update{{name.pascalCase()}} = Update{{name.pascalCase()}}(repository);
    _delete{{name.pascalCase()}} = Delete{{name.pascalCase()}}(repository);
    _getAll{{name.pascalCase()}}s = GetAll{{name.pascalCase()}}s(repository);
    _getSync{{name.pascalCase()}}s = GetAll{{name.pascalCase()}}s(syncRespository);
    _get{{name.pascalCase()}}ById = Get{{name.pascalCase()}}ById(repository);
    _sync{{name.pascalCase()}}s = Sync{{name.pascalCase()}}s(syncRespository);
    unawaited(fetch{{name.pascalCase()}}s());
    return const {{name.pascalCase()}}State();
  }

  Future<void> fetch{{name.pascalCase()}}s() async {
    final isConnected = await ref.read(networkInfoProvider).isConnected;
    final context = _buildActionContext();
    await Fetch{{name.pascalCase()}}sCommand(
      context: context,
      getAll{{name.pascalCase()}}s: isConnected ? _getAll{{name.pascalCase()}}s : _getSync{{name.pascalCase()}}s,
      paginationData: _paginationData,
      updatePagination: (data) => _paginationData = data,
    ).execute();
  }

  Future<void> add{{name.pascalCase()}}(Add{{name.pascalCase()}}Params params) async {
    final context = _buildActionContext();
    await Add{{name.pascalCase()}}Command(
      context: context,
      add{{name.pascalCase()}}: _add{{name.pascalCase()}},
      params: params,
    ).execute();
  }

  Future<void> update{{name.pascalCase()}}(Update{{name.pascalCase()}}Params params) async {
    final context = _buildActionContext();
    await Update{{name.pascalCase()}}Command(
      context: context,
      update{{name.pascalCase()}}: _update{{name.pascalCase()}},
      params: params,
    ).execute();
  }

  Future<void> get{{name.pascalCase()}}ById(Get{{name.pascalCase()}}ByIdParams params) async {
    final context = _buildActionContext();
    await Get{{name.pascalCase()}}ByIdCommand(
      context: context,
      get{{name.pascalCase()}}ById: _get{{name.pascalCase()}}ById,
      params: params,
    ).execute();
  }

  Future<void> delete{{name.pascalCase()}}(Delete{{name.pascalCase()}}Params params) async {
    final context = _buildActionContext();
    await Delete{{name.pascalCase()}}Command(
      context: context,
      delete{{name.pascalCase()}}: _delete{{name.pascalCase()}},
      params: params,
    ).execute();
  }

  void sync{{name.pascalCase()}}s() {
    final items = state.{{name.snakeCase()}}s;
    unawaited(
      Sync{{name.pascalCase()}}sCommand(items: items, sync{{name.pascalCase()}}s: _sync{{name.pascalCase()}}s)
          .execute(),
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
            sync{{name.pascalCase()}}s();
          }
        },
      );
}


