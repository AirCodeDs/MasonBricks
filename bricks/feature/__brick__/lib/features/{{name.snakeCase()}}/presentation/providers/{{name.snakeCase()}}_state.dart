// Project imports:
import 'package:urban_transport/features/{{name.snakecase()}}/data/models/{{name.snakecase()}}_model.dart';

class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State({this.{{name.snakecase()}}s = const [], this.errorMessage});
  final List<{{name.pascalCase()}}Model> {{name.snakecase()}}s;
  final String? errorMessage;

  {{name.pascalCase()}}State copyWith({List<{{name.pascalCase()}}Model>? {{name.snakecase()}}s, String? errorMessage}) =>
      {{name.pascalCase()}}State(
        {{name.snakecase()}}s: {{name.snakecase()}}s ?? this.{{name.snakecase()}}s,
        errorMessage: errorMessage,
      );
}
