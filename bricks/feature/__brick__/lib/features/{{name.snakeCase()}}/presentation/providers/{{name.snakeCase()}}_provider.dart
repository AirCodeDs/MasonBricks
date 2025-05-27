// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/utils/models/pagination_data_model.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart';
import 'package:{{project_name}}/features/{{name}}/data/repositories/{{name}}_repository_impl.dart';
import 'package:{{project_name}}/features/{{name}}/domain/use_cases/add_{{name}}.dart';
import 'package:{{project_name}}/features/{{name}}/domain/use_cases/delete_{{name}}.dart';
import 'package:{{project_name}}/features/{{name}}/domain/use_cases/get_all_{{name}}s.dart';
import 'package:{{project_name}}/features/{{name}}/domain/use_cases/get_{{name}}_by_id.dart';
import 'package:{{project_name}}/features/{{name}}/domain/use_cases/update_{{name}}.dart';


part '{{name}}_provider.g.dart'; // N'oublie pas de générer ce fichier après la création !

@riverpod
class {{name.pascalCase()}}Notifier extends _${{name.pascalCase()}}Notifier {
  late final Add{{name.pascalCase()}} _add{{name.pascalCase()}};
  late final Update{{name.pascalCase()}} _update{{name.pascalCase()}};
  late final Delete{{name.pascalCase()}} _delete{{name.pascalCase()}};
  late final GetAll{{name.pascalCase()}}s _getAll{{name.pascalCase()}}s;
  late final Get{{name.pascalCase()}}ById _get{{name.pascalCase()}}ById;

  PaginationDataModel<List<{{name.pascalCase()}}Model>>? _paginationData;

  @override
  FutureOr<List<{{name.pascalCase()}}Model>> build() async {
    final repositoryImpl = ref.read({{name.camelCase()}}RepositoryImplProvider);
    _add{{name.pascalCase()}} = Add{{name.pascalCase()}}(repositoryImpl);
    _update{{name.pascalCase()}} = Update{{name.pascalCase()}}(repositoryImpl);
    _delete{{name.pascalCase()}} = Delete{{name.pascalCase()}}(repositoryImpl);
    _getAll{{name.pascalCase()}}s = GetAll{{name.pascalCase()}}s(repositoryImpl);
    _get{{name.pascalCase()}}ById = Get{{name.pascalCase()}}ById(repositoryImpl);

    return await fetch{{name.pascalCase()}}s();
  }

  /// Récupère toutes les entités {{name.pascalCase()}} et initialise le provider.
  Future<List<{{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}s({bool loadMore = false}) async {
    state = const AsyncLoading(); // Indique un état de chargement

    final result = await _getAll{{name.pascalCase()}}s(
      NoParams(
        paginationPageIndex:
            loadMore ? _paginationData?.getNextPageIndex() ?? 1 : 1,
      ),
    );

    return result.fold(
      (failure) {
        state = AsyncError(failure.errorMessage, StackTrace.current); // Met l'état en erreur
        return []; // Retourne une liste vide en cas d'erreur
      },
      (paginationData) {
        _paginationData = paginationData;
        final currentItems = state.value ?? []; // Récupère les éléments existants
        final newItems = [...currentItems, ...paginationData.child];
        state = AsyncData(newItems); // Met à jour l'état avec les nouvelles données
        return newItems;
      },
    );
  }

  /// Ajoute une nouvelle entité {{name.pascalCase()}} et l'ajoute à la liste en mémoire.
  // Add this to complete the add{{name.pascalCase()}} method
  @override
  Future<Either<Failure, ApiResponse>> add{{name.pascalCase()}}(Map<String, dynamic> data) async {
    final result = await _add{{name.pascalCase()}}(BodyParams(params: data));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        // Refresh the list after adding
        fetch{{name.pascalCase()}}s();
        return Right(apiResponse);
      },
    );
  }

  // Add update method
  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(String id, Map<String, dynamic> data) async {
    data['id'] = id; // Ensure ID is included in the update data
    final result = await _update{{name.pascalCase()}}(UrlAndBodyParams(params: data));

    return result.fold(
      (failure) => Left(failure),
      (updated{{name.pascalCase()}}) {
        // Update the item in the state
        final currentItems = state.value ?? [];
        final updatedItems = currentItems.map((item) {
          return item.id == id ? updated{{name.pascalCase()}} : item;
        }).toList();
        
        state = AsyncData(updatedItems);
        return Right(updated{{name.pascalCase()}});
      },
    );
  }

  // Add delete method
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(String id) async {
    final result = await _delete{{name.pascalCase()}}(UrlParam(id: id));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        // Remove the item from the state
        final currentItems = state.value ?? [];
        final updatedItems = currentItems.where((item) => item.id != id).toList();
        
        state = AsyncData(updatedItems);
        return Right(apiResponse);
      },
    );
  }

  // Add get by ID method
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(String id) async {
    return await _get{{name.pascalCase()}}ById(UrlParam(id: id));
  }
  /// Met à jour une entité {{name.pascalCase()}} existante dans la liste en mémoire.
  Future<Either<Failure, ApiResponse>> update{{name.pascalCase()}}(Map<String, dynamic> data, String {{name.camelCase()}}Id) async {
    final result = await _update{{name.pascalCase()}}(UrlAndBodyParams(params: data, urlParam: UrlParam({{name.camelCase()}}Id)));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        // Si l'API retourne l'objet mis à jour, le remplacer dans la liste
        // Exemple (adapter selon la structure de ta ApiResponse):
        // if (apiResponse.data is Map<String, dynamic>) {
        //   final updated{{name.pascalCase()}} = {{name.pascalCase()}}Model.fromMap(apiResponse.data);
        //   state = AsyncData([
        //     for (final item in state.value ?? [])
        //       if (item.id == updated{{name.pascalCase()}}.id) updated{{name.pascalCase()}} else item,
        //   ]);
        // } else {
        //   fetch{{name.pascalCase()}}s(); // Recharger si la réponse ne contient pas l'objet
        // }
        fetch{{name.pascalCase()}}s(); // Rafraîchir pour cet exemple
        return Right(apiResponse);
      },
    );
  }

  /// Supprime une entité {{name.pascalCase()}} de la liste en mémoire.
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(String {{name.camelCase()}}Id) async {
    final result = await _delete{{name.pascalCase()}}(UrlParam({{name.camelCase()}}Id));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        state = AsyncData([
          for (final item in state.value ?? [])
            if (item.id != {{name.camelCase()}}Id) item,
        ]);
        return Right(apiResponse);
      },
    );
  }

  /// Récupère une entité {{name.pascalCase()}} par son ID (peut être de la liste en cache ou via l'API).
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(String {{name.camelCase()}}Id) async {
    // Tente de trouver dans la liste en cache d'abord
    final cachedItem = state.value?.firstWhere((item) => item.id == {{name.camelCase()}}Id, orElse: () => throw Exception('Item not found in cache'));

    if (cachedItem != null) {
      return Right(cachedItem);
    }

    // Si non trouvé, va chercher via le use case
    final result = await _get{{name.pascalCase()}}ById(UrlParam({{name.camelCase()}}Id));
    return result.fold(
      (failure) => Left(failure),
      ({{name.camelCase()}}) => Right({{name.camelCase()}}),
    );
  }

  /// Méthode pour obtenir l'erreur la plus récente, si elle existe.
  String? get currentError {
    return state.whenOrNull(
      error: (error, _) => error.toString(),
    );
  }

  /// Réinitialise l'état du provider.
  void clearState() {
    _paginationData = null;
    state = const AsyncData([]); // Ou AsyncValue.data([]) pour un état initial vide
  }

  // --- RIVERPOD INJECTIONS ---
  // Voici un exemple de comment injecter le repositoryImpl via Riverpod
  // en utilisant @Riverpod pour générer un provider pour celui-ci.
  // Tu devras probablement déplacer ceci dans un fichier partagé ou un autre provider
  // si tu ne l'as pas déjà fait.
}

@riverpod
{{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}RepositoryImpl(
  {{name.camelCase()}}RepositoryImplRef ref,
) {
  // Ici, tu injectes la source de données distante.
  // Tu auras besoin d'un provider pour ApiClient également.
  final remoteDataSource = ref.read({{name.camelCase()}}RemoteDataSourceProvider);
  // final localDataSource = ref.read({{name.camelCase()}}LocalDataSourceProvider); // Décommenter si tu as une source de données locale
  return {{name.pascalCase()}}RepositoryImpl(remoteDataSource /* , localDataSource */);
}

// Assurez-vous que tu as aussi un provider pour ton RemoteDataSource, ex:
@riverpod
{{name.pascalCase()}}RemoteDataSource {{name.camelCase()}}RemoteDataSource(
  {{name.camelCase()}}RemoteDataSourceRef ref,
) {
  final apiClient = ref.read(apiClientProvider); // Assurez-vous d'avoir un apiClientProvider
  return {{name.pascalCase()}}RemoteDataSource(apiClient);
}

// Exemple pour apiClientProvider (à placer dans un fichier de services partagés)
@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(); // Ou ta logique d'instanciation de ApiClient
}