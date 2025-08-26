import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{name.snakeCase()}}_form_provider.g.dart';

@riverpod
class {{name.pascalCase()}}FormProvider extends _${{name.pascalCase()}}FormProvider {
  @override
  Map<String, dynamic> build() => {
        'name': '',
      };

  void setName(String name) {
    state = {...state, 'name': name};
  }

  String? getField(String key) => state[key] as String?;

  String getName() => state['name'] as String? ?? '';

  void resetForm() {
    state = {
      'name': '',
    };
  }
}


