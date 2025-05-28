// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{name.snakeCase()}}_creation_provider.g.dart';

@riverpod
class {{name.pascalCase()}}CreationProvider extends _${{name.pascalCase()}}CreationProvider {
  @override
  Map<String, dynamic> build() => {'name': ''};

  void updateField(String key, String value) {
    state = {...state, key: value};
  }

  void resetForm() {
    state = {'name': ''};
  }
}
