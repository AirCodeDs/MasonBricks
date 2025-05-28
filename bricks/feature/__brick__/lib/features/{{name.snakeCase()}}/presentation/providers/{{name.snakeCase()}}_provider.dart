// Package imports:
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/core/api_response/api_response.dart';
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/errors/failure_message_resolver.dart';
import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/models/{{name.snake_case()}}_model.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/data/providers/repositories/{{name.snake_case()}}_remote_synced_in_local_repository_impl_provider.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/use_cases/add_{{name.snake_case()}}.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/use_cases/delete_{{name.snake_case()}}.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/use_cases/get_all_{{name.snake_case()}}s.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/use_cases/get_{{name.snake_case()}}_by_id.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/domain/use_cases/update_{{name.snake_case()}}.dart';
import 'package:urban_transport/features/{{name.snake_case()}}/presentation/providers/{{name.snake_case()}}_state.dart';

part '{{name.snake_case()}}_provider.g.dart';

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
    final {{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl = ref.read(
      {{name.snake_case()}}RemoteSyncedInLocalRepositoryImplProvider,
    );

    _add{{name.pascalCase()}} = Add{{name.pascalCase()}}({{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl);
    _update{{name.pascalCase()}} = Update{{name.pascalCase()}}({{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl);
    _delete{{name.pascalCase()}} = Delete{{name.pascalCase()}}({{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl);
    _getAll{{name.pascalCase()}}s = GetAll{{name.pascalCase()}}s({{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl);
    _get{{name.pascalCase()}}ById = Get{{name.pascalCase()}}ById({{name.snake_case()}}RemoteSyncedInLocalRepositoryImpl);

    final {{name.snake_case()}}s = await fetch{{name.pascalCase()}}s();
    return {{name.pascalCase()}}State({{name.snake_case()}}s: {{name.snake_case()}}s);
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
        state = AsyncData({{name.pascalCase()}}State({{name.snake_case()}}s: [], errorMessage: errorMsg));
        return [];
      },
      (paginationData) {
        _paginationData = paginationData;
        final currentItems = state.value?.{{name.snake_case()}}s ?? [];
        final newItems = [...currentItems, ...paginationData.child];
        state = AsyncData({{name.pascalCase()}}State({{name.snake_case()}}s: newItems));
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
        fetch{{name.pascalCase()}}s();
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
        final currentItems = state.value?.{{name.snake_case()}}s ?? [];
        final updatedItems = currentItems
            .map(
              (item) =>
                  item.id ==
                      update{{name.pascalCase()}}Params
                          .urlParams
                          .first //basicaly the id of the {{name.snake_case()}}
                  ? updated{{name.pascalCase()}}
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snake_case()}}s: updatedItems));
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
        final currentItems = state.value?.{{name.snake_case()}}s ?? [];
        final updatedItems = currentItems
            .where((item) => item.id != delete{{name.pascalCase()}}Params.urlParams.first)
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snake_case()}}s: updatedItems));
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
      ({{name.snake_case()}}Model) {
        final currentItems = state.value?.{{name.snake_case()}}s ?? [];
        final updatedItems = currentItems
            .map(
              (item) => item.id == get{{name.pascalCase()}}ByIdParams.urlParams.first
                  ? {{name.snake_case()}}Model
                  : item,
            )
            .toList();

        state = AsyncData(state.value!.copyWith({{name.snake_case()}}s: updatedItems));
        return Right({{name.snake_case()}}Model);
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
