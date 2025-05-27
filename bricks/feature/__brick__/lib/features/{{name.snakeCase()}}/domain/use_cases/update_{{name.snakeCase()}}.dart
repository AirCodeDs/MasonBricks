import 'package:{{project_name}}/core/errors/failure.dart';
import 'package:{{project_name}}/core/params/params.dart';
import 'package:{{project_name}}/core/use_cases/use_case.dart';
import 'package:{{project_name}}/features/{{name}}/data/models/{{name}}_model.dart'; // Pour le type de retour
import 'package:{{project_name}}/features/{{name}}/data/repositories/{{name}}_repository_impl.dart'; // Assure-toi que le chemin est correct

class Update{{name.pascalCase()}} extends UseCase<{{name.pascalCase()}}Model, UrlAndBodyParams> {
  Update{{name.pascalCase()}}(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<{{name.pascalCase()}}Model> call(UrlAndBodyParams urlAndBodyParams) {
    return _repository.update(urlAndBodyParams);
  }
}


