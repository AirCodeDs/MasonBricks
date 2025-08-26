// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hbh_connect/features/product/data/data_sources/product_http_rest_data_source.dart';

// Project imports:

part 'product_http_rest_data_source_provider.g.dart';

@riverpod
ProductHttpRestDataSource productHttpRestDataSource(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return ProductHttpRestDataSource(apiClient: apiClient);
}
