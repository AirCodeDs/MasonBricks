// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/repositories/product_mock_repository.dart';
import 'package:hbh_connect/features/product/providers/data_sources/product_mock_data_source_provider.dart';

part 'product_mock_repository_provider.g.dart';

@riverpod
ProductMockRepository productMockRepository(Ref ref) {
  final mockDataSource = ref.read(productMockDataSourceProvider);
  return ProductMockRepository(mockDataSource: mockDataSource);
}
