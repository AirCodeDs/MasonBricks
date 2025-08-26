// Project imports:
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/application/use_cases/sync_products.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class Sync{{name.pascalCase()}}sCommand {
  Sync{{name.pascalCase()}}sCommand({required this.{{name.snakeCase()}}s, required this.Sync{{name.pascalCase()}}s});

  final List<{{name.snakeCase()}}> {{name.snakeCase()}}s;
  final Sync{{name.pascalCase()}}s Sync{{name.pascalCase()}}s;

  Future<void> execute() async {
    await Sync{{name.pascalCase()}}s.call(Sync{{name.pascalCase()}}sParams({{name.snakeCase()}}s: {{name.snakeCase()}}s));
  }
}
