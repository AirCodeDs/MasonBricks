// Package imports:
import 'package:app_services/app_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/data_sources/product_mock_data_source.dart';

part 'product_mock_data_source_provider.g.dart';

@riverpod
ProductMockDataSource productMockDataSource(Ref ref) {
  final mockApiClient = ref.read(mockApiClientProvider);
  return ProductMockDataSource(apiClient: mockApiClient);
}
