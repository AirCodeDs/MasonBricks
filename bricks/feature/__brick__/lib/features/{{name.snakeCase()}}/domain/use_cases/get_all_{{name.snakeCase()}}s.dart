import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/use_cases/use_case.dart';
import 'package:{{project_name}}/core/utils/models/pagination_data_model.dart'; // Pour le type de retour
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart'; // Pour le type de retour
import 'package:{{project_name}}/features/{{name}}/data/domaine/repositories/{{name}}_repository_interface.dart'; 

class GetAll{{name.pascalCase()}}s implements UseCase<PaginationDataModel<List<{{name.pascalCase()}}Model>>, NoParams> {
  GetAll{{name.pascalCase()}}s(this._repository);
  final {{name.pascalCase()}}RepositoryInterface _repository;

  @override
  Future<Either<Failure, PaginationDataModel<List<{{name.pascalCase()}}Model>>>> call(
    NoParams noParams,
  ) =>
      _repository.getAll{{name.pascalCase()}}s(noParams);
}
