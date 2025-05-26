
// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/features/real_estate/data/models/real_estate_model.dart'; // Assurez-vous que le modèle existe

abstract class RealEstateRepository {
  /// Crée une nouvelle entité `RealEstate`.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ApiResponse>> addRealEstate(
    TemplateParams templateParams,
  );

  /// Met à jour une entité `RealEstate` existante.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, RealEstateModel>> updateRealEstate(
    TemplateParams templateParams,
  );

  /// Supprime une entité `RealEstate` par son ID.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ApiResponse>> deleteRealEstate(
    ParamOne paramOne,
  );

  /// Récupère toutes les entités `RealEstate` avec pagination.
  ///
  /// Retourne une [PaginationDataModel] contenant une liste de [RealEstateModel]
  /// en cas de succès, ou une [Failure] en cas d'erreur.
  Future<Either<Failure, PaginationDataModel<List<RealEstateModel>>>> getAllRealEstates(
    NoParams noParams,
  );

  /// Récupère une entité `RealEstate` par son ID.
  ///
  /// Retourne un [RealEstateModel] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, RealEstateModel>> getRealEstateById(
    ParamOne paramOne,
  );
}