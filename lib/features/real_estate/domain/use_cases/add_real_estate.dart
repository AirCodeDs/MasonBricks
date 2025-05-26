// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/use_cases/use_case.dart';
import 'package:/features/real_estate/data/repositories/real_estate_repository_impl.dart'; // Assure-toi que le chemin est correct

class AddRealEstate implements UseCase<ApiResponse, TemplateParams> {
  AddRealEstate(this.realEstateRepositoryImpl);
  final RealEstateRepositoryImpl realEstateRepositoryImpl;

  @override
  Future<Either<Failure, ApiResponse>> call(
    TemplateParams templateParams,
  ) =>
      realEstateRepositoryImpl.addRealEstate(templateParams);
}