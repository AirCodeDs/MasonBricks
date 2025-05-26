// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/use_cases/use_case.dart';
import 'package:/core/utils/models/pagination_data_model.dart'; // Pour le type de retour
import 'package:/features/real_estate/data/models/real_estate_model.dart'; // Pour le type de retour
import 'package:/features/real_estate/data/repositories/real_estate_repository_impl.dart'; // Assure-toi que le chemin est correct

class GetAllRealEstates implements UseCase<PaginationDataModel<List<RealEstateModel>>, NoParams> {
  GetAllRealEstates(this.realEstateRepositoryImpl);
  final RealEstateRepositoryImpl realEstateRepositoryImpl;

  @override
  Future<Either<Failure, PaginationDataModel<List<RealEstateModel>>>> call(
    NoParams noParams,
  ) =>
      realEstateRepositoryImpl.getAllRealEstates(noParams);
}