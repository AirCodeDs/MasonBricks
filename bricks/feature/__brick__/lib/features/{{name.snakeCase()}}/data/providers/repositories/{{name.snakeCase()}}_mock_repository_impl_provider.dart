// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/data/providers/data_sources/product_mock_data_source_provider.dart';
import 'package:urban_transport/features/product/data/repositories/product_mock_repository_impl.dart';

part 'product_mock_repository_impl_provider.g.dart';

@riverpod
ProductMockRepositoryImpl productLocalRepositoryImpl(Ref ref) {
  final mockDataSource = ref.read(productMockDataSourceProvider);
  return ProductMockRepositoryImpl(mockDataSource: mockDataSource);
}
