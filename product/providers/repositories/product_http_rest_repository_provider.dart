// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:hbh_connect/features/product/data/repositories/product_http_rest_repository.dart';
import 'package:hbh_connect/features/product/providers/data_sources/product_http_rest_data_source_provider.dart';

part 'product_http_rest_repository_provider.g.dart';

@riverpod
ProductHttpRestRepository productHttpRestRepository(Ref ref) {
  final remoteDataSource = ref.read(productHttpRestDataSourceProvider);
  return ProductHttpRestRepository(httpRestDataSource: remoteDataSource);
}
