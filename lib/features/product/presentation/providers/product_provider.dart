// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/features/product/data/models/product_model.dart';
import 'package:/features/product/data/repositories/product_repository_impl.dart';
import 'package:/features/product/domain/use_cases/add_product.dart';
import 'package:/features/product/domain/use_cases/delete_product.dart';
import 'package:/features/product/domain/use_cases/get_all_products.dart';
import 'package:/features/product/domain/use_cases/get_by_id_product.dart';
import 'package:/features/product/domain/use_cases/update_product.dart';


part 'product_provider.g.dart'; // N'oublie pas de générer ce fichier après la création !

@Riverpod(keepAlive: true)
class ProductNotifier extends _$ProductNotifier {
  late final AddProduct _addProduct;
  late final UpdateProduct _updateProduct;
  late final DeleteProduct _deleteProduct;
  late final GetAllProducts _getAllProducts;
  late final GetProductById _getProductById;

  PaginationDataModel<List<ProductModel>>? _paginationData;

  @override
  FutureOr<List<ProductModel>> build() async {
    final repositoryImpl = ref.read(productRepositoryImplProvider);
    _addProduct = AddProduct(repositoryImpl);
    _updateProduct = UpdateProduct(repositoryImpl);
    _deleteProduct = DeleteProduct(repositoryImpl);
    _getAllProducts = GetAllProducts(repositoryImpl);
    _getProductById = GetProductById(repositoryImpl);

    return await fetchProducts();
  }

  /// Récupère toutes les entités Product et initialise le provider.
  Future<List<ProductModel>> fetchProducts({bool loadMore = false}) async {
    state = const AsyncLoading(); // Indique un état de chargement

    final result = await _getAllProducts(
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

  /// Ajoute une nouvelle entité Product et l'ajoute à la liste en mémoire.
  Future<Either<Failure, ApiResponse>> addProduct(Map<String, dynamic> data) async {
    final result = await _addProduct(TemplateParams(params: data));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        // Option 1: Recharger toute la liste si l'API ne retourne pas l'objet complet
        // fetchProducts();
        // Option 2: Si l'API retourne l'objet ajouté, l'ajouter directement
        // Exemple (adapter selon la structure de ta ApiResponse):
        // if (apiResponse.data is Map<String, dynamic>) {
        //   final newProduct = ProductModel.fromMap(apiResponse.data);
        //   state = AsyncData([...(state.value ?? []), newProduct]);
        // } else {
        //   fetchProducts(); // Recharger si la réponse ne contient pas l'objet
        // }
        // Pour cet exemple simple, nous allons supposer que nous recevons l'objet créé.
        // C'est une simplification, en réalité il faudrait le récupérer ou le recharger.
        // Pour l'exercice, on va rafraîchir la liste complète après un add/update pour être sûr.
        fetchProducts();
        return Right(apiResponse);
      },
    );
  }

  /// Met à jour une entité Product existante dans la liste en mémoire.
  Future<Either<Failure, ApiResponse>> updateProduct(Map<String, dynamic> data, String productId) async {
    final result = await _updateProduct(TemplateParams(params: data, paramOne: ParamOne(productId)));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        // Si l'API retourne l'objet mis à jour, le remplacer dans la liste
        // Exemple (adapter selon la structure de ta ApiResponse):
        // if (apiResponse.data is Map<String, dynamic>) {
        //   final updatedProduct = ProductModel.fromMap(apiResponse.data);
        //   state = AsyncData([
        //     for (final item in state.value ?? [])
        //       if (item.id == updatedProduct.id) updatedProduct else item,
        //   ]);
        // } else {
        //   fetchProducts(); // Recharger si la réponse ne contient pas l'objet
        // }
        fetchProducts(); // Rafraîchir pour cet exemple
        return Right(apiResponse);
      },
    );
  }

  /// Supprime une entité Product de la liste en mémoire.
  Future<Either<Failure, ApiResponse>> deleteProduct(String productId) async {
    final result = await _deleteProduct(ParamOne(productId));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        state = AsyncData([
          for (final item in state.value ?? [])
            if (item.id != productId) item,
        ]);
        return Right(apiResponse);
      },
    );
  }

  /// Récupère une entité Product par son ID (peut être de la liste en cache ou via l'API).
  Future<Either<Failure, ProductModel>> getProductById(String productId) async {
    // Tente de trouver dans la liste en cache d'abord
    final cachedItem = state.value?.firstWhere((item) => item.id == productId, orElse: () => throw Exception('Item not found in cache'));

    if (cachedItem != null) {
      return Right(cachedItem);
    }

    // Si non trouvé, va chercher via le use case
    final result = await _getProductById(ParamOne(productId));
    return result.fold(
      (failure) => Left(failure),
      (product) => Right(product),
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

@Riverpod(keepAlive: true)
ProductRepositoryImpl productRepositoryImpl(
  productRepositoryImplRef ref,
) {
  // Ici, tu injectes la source de données distante.
  // Tu auras besoin d'un provider pour ApiClient également.
  final remoteDataSource = ref.read(productRemoteDataSourceProvider);
  // final localDataSource = ref.read(productLocalDataSourceProvider); // Décommenter si tu as une source de données locale
  return ProductRepositoryImpl(remoteDataSource /* , localDataSource */);
}

// Assurez-vous que tu as aussi un provider pour ton RemoteDataSource, ex:
@Riverpod(keepAlive: true)
ProductRemoteDataSource productRemoteDataSource(
  productRemoteDataSourceRef ref,
) {
  final apiClient = ref.read(apiClientProvider); // Assurez-vous d'avoir un apiClientProvider
  return ProductRemoteDataSource(apiClient);
}

// Exemple pour apiClientProvider (à placer dans un fichier de services partagés)
@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(); // Ou ta logique d'instanciation de ApiClient
}