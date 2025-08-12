// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_creation_notifier.g.dart';

@riverpod
class ProductCreationProvider extends _$ProductCreationProvider {
  @override
  Map<String, dynamic> build() => {'name': ''};

  void updateField(String key, String value) {
    state = {...state, key: value};
  }

  void resetForm() {
    state = {'name': ''};
  }
}
