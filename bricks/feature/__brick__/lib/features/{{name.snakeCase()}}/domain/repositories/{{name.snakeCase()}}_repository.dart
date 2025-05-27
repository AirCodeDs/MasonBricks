
// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:{{project_name}}/core/api_response/api_response.dart';
import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/utils/models/pagination_data_model.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart'; // Assurez-vous que le modèle existe

abstract class {{name.pascalCase()}}Repository {
  /// Crée une nouvelle entité `{{name.pascalCase()}}`.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, {{name.pascalCase()}}Model>> add{{name.pascalCase()}}(
    BodyParams bodyParams,
  );

  /// Met à jour une entité `{{name.pascalCase()}}` existante.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, {{name.pascalCase()}}Model>> update{{name.pascalCase()}}(
    UrlAndBodyParams urlAndBodyParams,
  );

  /// Supprime une entité `{{name.pascalCase()}}` par son ID.
  ///
  /// Retourne un [ApiResponse] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, ApiResponse>> delete{{name.pascalCase()}}(
    ParamOne paramOne,
  );

  /// Récupère toutes les entités `{{name.pascalCase()}}` avec pagination.
  ///
  /// Retourne une [PaginationDataModel] contenant une liste de [{{name.pascalCase()}}Model]
  /// en cas de succès, ou une [Failure] en cas d'erreur.
  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>> getAll{{name.pascalCase()}}s(
    NoParams noParams,
  );

  /// Récupère une entité `{{name.pascalCase()}}` par son ID.
  ///
  /// Retourne un [{{name.pascalCase()}}Model] en cas de succès ou une [Failure] en cas d'erreur.
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}ById(
    ParamOne paramOne,
  );
}
