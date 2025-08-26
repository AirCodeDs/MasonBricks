// Package imports:
import 'package:app_core_kit/app_core_kit.dart';

// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart'; // Pour le type de retour

class Get{{name.pascalCase()}}ById extends UseCase<{{name.snakeCase()}}, Get{{name.pascalCase()}}ByIdParams> {
  Get{{name.pascalCase()}}ById(this._repository);
  final {{name.pascalCase()}}Repository _repository;

  @override
  Future<ApiResponse<{{name.snakeCase()}}>> call(
    Get{{name.pascalCase()}}ByIdParams Get{{name.pascalCase()}}ByIdParams,
  ) => _repository.Get{{name.pascalCase()}}ById(Get{{name.pascalCase()}}ByIdParams);
}

class Get{{name.pascalCase()}}ByIdParams extends UrlParams {
  Get{{name.pascalCase()}}ByIdParams({required String id})
    : super(
        urlParams: [id].whereType<String>().toList(),
        // paginationPageIndex: paginationPageIndex,
      );
}

// class Get{{name.pascalCase()}}ByIdParams extends UrlParams {
//   Get{{name.pascalCase()}}ByIdParams({
//     required String urlParam1,
//     required String urlParam2,
//     String? urlParam3,
//     //  int? paginationPageIndex,
//   }) : super(
//           urlParams: [
//             urlParam1,
//             urlParam2,
//             urlParam3,
//           ].whereType<String>().toList(),
//           // paginationPageIndex: paginationPageIndex,
//         );
// }
