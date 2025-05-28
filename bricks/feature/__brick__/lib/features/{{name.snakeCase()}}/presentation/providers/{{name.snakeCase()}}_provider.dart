// Package imports:
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{name.snakeCase()}}/core/api_response/api_response.dart';
import 'package:{{name.snakeCase()}}/core/errors/failure.dart';
import 'package:{{name.snakeCase()}}/core/errors/failure_message_resolver.dart';
import 'package:{{name.snakeCase()}}/core/utils/metadata/pagination_data_model.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/data/providers/repositories/{{name.snakeCase()}}_remote_synced_in_local_repository_impl_provider.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/use_cases/add_{{name.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/use_cases/delete_{{name.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/use_cases/get_all_{{name.snakeCase()}}s.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/use_cases/get_{{name.snakeCase()}}_by_id.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/domain/use_cases/update_{{name.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/features/{{name.snakeCase()}}/presentation/providers/{{name.snakeCase()}}_state.dart';

part '{{name.snakeCase()}}_provider.g.dart';

@riverpod
class {{name.pascalCase()}}Notifier extends _${{name.pascalCase()}}Notifier {
  late final Add{{name.pascalCase()}} _add{{name.pascalCase()}};
  late final Update{{name.pascalCase()}} _update{{name.pascalCase()}};
  late final Delete{{name.pascalCase()}} _delete{{name.pascalCase()}};
  late final GetAll{{name.pascalCase()}}s _getAll{{name.pascalCase()}}s;
  late final Get{{name.pascalCase()}}ById _get{{name.pascalCase()}}ById;

  PaginationDataModel<List<{{name.pascalCase()}}Model>>? _paginationData;

  @override
  FutureOr<{{name.pascalCase()}}State> build() async {
    final {{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl = ref.read(
      {{name.snakeCase()}}RemoteSyncedInLocalRepositoryImplProvider,
    );

    _add{{name.pascalCase()}} = Add{{name.pascalCase()}}({{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl);
    _update{{name.pascalCase()}} = Update{{name.pascalCase()}}({{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl);
    _delete{{name.pascalCase()}} = Delete{{name.pascalCase()}}({{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl);
    _getAll{{name.pascalCase()}}s = GetAll{{name.pascalCase()}}s({{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl);
    _get{{name.pascalCase()}}ById = Get{{name.pascalCase()}}ById({{name.snakeCase()}}RemoteSyncedInLocalRepositoryImpl);

    final {{name.snakeCase()}}s = await fetch{{name.pascalCase()}}s();
    return {{name.pascalCase()}}State({{name.snakeCase()}}s: {{name.snakeCase()}}s);
  }

  Future<List<{{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}s({bool loadMore = false}) async {
    state = const AsyncLoading();
    final result = await _getAll{{name.pascalCase()}}s(
      GetAll{{name.pascalCase()}}Params(
        paginationPageIndex: loadMore
            ? _paginationData?.getNextPageIndex() ?? 1
            : 1,
      ),
    );

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData({{name.pascalCase()}}State({{name.snakeCase()}}s: [], errorMessage: errorMsg));
        return [];
      },
      (paginationData) {
        _paginationData = paginationData;
        final currentItems = state.value?.{{name.snakeCase()}}s ?? [];
        final newItems = [...currentItems, ...paginationData.child];
        state = AsyncData({{name.pascalCase()}}State({{name.snakeCase()}}s: newItems));
        return newItems;
      },
    );
  }

  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    Add{{name.pascalCase()}}Params add{{name.pascalCase()}}Params,
  ) async {
    final result = await _add{{name.pascalCase()}}(add{{name.pascalCase()}}Params);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (success) {
        final currentItems = state.value?.{{name.pascalCase()}}Model ?? [];
        final newItems = [success, ...currentItems];
        state = AsyncData(state.value!.copyWith({{name.pascalCase()}}Model: newItems));
        return Right(success);
      },
    );
  }

  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(
    Update{{name.pascalCase()}}Params update{{name.pascalCase()}}Params,
  ) async {
    final result = await _update{{name.pascalCase()}}(update{{name.pascalCase()}}Params);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (updated{{name.pascalCase()}}) {
        final currentItems = state.value?.{{name.snakeCase()}}s ?? [];
        final updatedItems = currentItems
            .map(
              (item) =>
                  item.id ==
                      update{{name.pascalCase()}}Params
                          .urlParams
                          .first //basicaly the id of the {{name.snakeCase()}}
                  ? updated{{name.pascalCase()}}
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snakeCase()}}s: updatedItems));
        return Right(updated{{name.pascalCase()}});
      },
    );
  }

  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(
    Delete{{name.pascalCase()}}Params delete{{name.pascalCase()}}Params,
  ) async {
    final result = await _delete{{name.pascalCase()}}(delete{{name.pascalCase()}}Params);

    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      (apiResponse) {
        final currentItems = state.value?.{{name.snakeCase()}}s ?? [];
        final updatedItems = currentItems
            .where((item) => item.id != delete{{name.pascalCase()}}Params.urlParams.first)
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snakeCase()}}s: updatedItems));
        return Right(apiResponse);
      },
    );
  }

  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(
    Get{{name.pascalCase()}}ByIdParams get{{name.pascalCase()}}ByIdParams,
  ) async {
    final result = await _get{{name.pascalCase()}}ById(get{{name.pascalCase()}}ByIdParams);
    return result.fold(
      (failure) {
        final errorMsg = ref.read(failureMessageResolverProvider(failure));
        state = AsyncData(state.value!.copyWith(errorMessage: errorMsg));
        return Left(failure);
      },
      ({{name.snakeCase()}}Model) {
        final currentItems = state.value?.{{name.snakeCase()}}s ?? [];
        final updatedItems = currentItems
            .map(
              (item) => item.id == get{{name.pascalCase()}}ByIdParams.urlParams.first
                  ? {{name.snakeCase()}}Model
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snakeCase()}}s: updatedItems));
        return Right({{name.snakeCase()}}Model);
      },
    );
  }

  String? get currentError => state.whenOrNull(
    data: (value) => value.errorMessage,
    error: (error, _) => error.toString(),
  );

  void clearState() {
    _paginationData = null;
    state = const AsyncData({{name.pascalCase()}}State());
  }
}
