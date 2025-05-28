// Project imports:
import 'package:urban_transport/features/{{name.snake_case()}}/data/models/{{name.snake_case()}}_model.dart';

class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State({this.{{name.snake_case()}}s = const [], this.errorMessage});
  final List<{{name.pascalCase()}}Model> {{name.snake_case()}}s;
  final String? errorMessage;

  {{name.pascalCase()}}State copyWith({List<{{name.pascalCase()}}Model>? {{name.snake_case()}}s, String? errorMessage}) =>
      {{name.pascalCase()}}State(
        {{name.snake_case()}}s: {{name.snake_case()}}s ?? this.{{name.snake_case()}}s,
        errorMessage: errorMessage,
      );
}
