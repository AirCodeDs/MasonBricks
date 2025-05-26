
// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/features/product/data/models/product_model.dart'; // Assurez-vous que le modèle existe

abstract class ProductRepository {
  /// Crée une nouvelle entité `Product`.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ApiResponse>> addProduct(
    TemplateParams templateParams,
  );

  /// Met à jour une entité `Product` existante.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ProductModel>> updateProduct(
    TemplateParams templateParams,
  );

  /// Supprime une entité `Product` par son ID.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ApiResponse>> deleteProduct(
    ParamOne paramOne,
  );

  /// Récupère toutes les entités `Product` avec pagination.
  ///
  /// Retourne une [PaginationDataModel] contenant une liste de [ProductModel]
  /// en cas de succès, ou une [Failure] en cas d'erreur.
  Future<Either<Failure, PaginationDataModel<List<ProductModel>>>> getAllProducts(
    NoParams noParams,
  );

  /// Récupère une entité `Product` par son ID.
  ///
  /// Retourne un [ProductModel] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ProductModel>> getProductById(
    ParamOne paramOne,
  );
}