// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:urban_transport/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:urban_transport/services/api/providers/api_provider.dart';

part 'product_remote_data_source_provider.g.dart';

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return ProductRemoteDataSource(apiClient: apiClient);
}
