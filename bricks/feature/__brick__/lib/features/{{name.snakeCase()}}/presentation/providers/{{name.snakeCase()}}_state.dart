// Project imports:
import 'package:urban_transport/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State({this.{{name.snakeCase()}}s = const [], this.errorMessage});
  final List<{{name.pascalCase()}}Model> {{name.snakeCase()}}s;
  final String? errorMessage;

  {{name.pascalCase()}}State copyWith({List<{{name.pascalCase()}}Model>? {{name.snakeCase()}}s, String? errorMessage}) =>
      {{name.pascalCase()}}State(
        {{name.snakeCase()}}s: {{name.snakeCase()}}s ?? this.{{name.snakeCase()}}s,
        errorMessage: errorMessage,
      );
}
