// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';

import 'package:urban_transport/core/utils/metadata/pagination_data_model.dart'; // Pour le type de retour
import 'package:urban_transport/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository_interface.dart'; // Pour le type de retour

class GetAll{{name.pascalCase()}}s
    implements UseCase<PaginationDataModel<List<{{name.pascalCase()}}Model>>, NoParams> {
  GetAll{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>> call(
    NoParams noParams,
  ) => _repository.getAll{{name.pascalCase()}}s(noParams);
}

class GetAll{{name.pascalCase()}}Params extends NoParams {
  GetAll{{name.pascalCase()}}Params({super.paginationPageIndex});
}
