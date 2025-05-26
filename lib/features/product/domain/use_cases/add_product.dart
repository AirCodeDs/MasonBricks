// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/use_cases/use_case.dart';
import 'package:/features/product/data/repositories/product_repository_impl.dart'; // Assure-toi que le chemin est correct

class AddProduct implements UseCase<ApiResponse, TemplateParams> {
  AddProduct(this.productRepositoryImpl);
  final ProductRepositoryImpl productRepositoryImpl;

  @override
  Future<Either<Failure, ApiResponse>> call(
    TemplateParams templateParams,
  ) =>
      productRepositoryImpl.addProduct(templateParams);
}