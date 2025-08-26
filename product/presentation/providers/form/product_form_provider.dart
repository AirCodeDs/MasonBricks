// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_form_provider.g.dart';

@riverpod
class ProductFormProvider extends _$ProductFormProvider {
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
