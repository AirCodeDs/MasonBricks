// ignore_for_file: avoid_dynamic_calls

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/constants/error_text_string.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/core/utils/type_convertor/type_convertor.dart';
import 'package:/features/real_estate/data/data_sources/remote/real_estate_remote_data_source.dart';
import 'package:/features/real_estate/data/models/real_estate_model.dart';
import 'package:/features/real_estate/domain/repositories/real_estate_repository.dart';

class RealEstateRepositoryImpl implements RealEstateRepository {
  RealEstateRepositoryImpl(this.remoteDataSource, /* this.localDataSource */); // Décommenter localDataSource si utilisé
  final RealEstateRemoteDataSource remoteDataSource;
  // final RealEstateLocalDataSource localDataSource; // Décommenter si tu as une source de données locale

  @override
  Future<Either<Failure, ApiResponse>> addRealEstate(
    TemplateParams templateParams,
  ) async {
    try {
      final response = await remoteDataSource.addRealEstate(
        templateParams,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> deleteRealEstate(ParamOne paramOne) async {
    try {
      final response = await remoteDataSource.deleteRealEstate(
        paramOne,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<List<RealEstateModel>>>> getAllRealEstates(
    NoParams noParams,
  ) async {
    try {
      final response = await remoteDataSource.getAllRealEstates(
        noParams,
      );
      if (response['success'] == true) {
        final realEstates = TypeConvertor()
            .convertToListOfMaps(response['data']['data'] as List)
            .map(RealEstateModel.fromMap)
            .toList();
        final realEstatesWithPagination =
            PaginationDataModel.fromMap(response['data']['pagination'], realEstates);

        return Right(realEstatesWithPagination);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RealEstateModel>> getRealEstateById(
    ParamOne paramOne,
  ) async {
    try {
      final response = await remoteDataSource.getRealEstateById(
        paramOne,
      );

      if (response['success'] == true) {
        final realEstate = RealEstateModel.fromMap(response['data']);
        return Right(realEstate);
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> updateRealEstate(
    TemplateParams templateParams,
  ) async {
    try {
      final response = await remoteDataSource.updateRealEstate(
        templateParams,
      );
      if (response['success'] == true) {
        return Right(ApiResponse(response['message']));
      } else {
        return Left(
          ServerFailure(errorMessage: response['message'].toString()),
        );
      }
    } catch (e) {
      final errorMsg = await ErrorText.errorMsg;
      return Left(
        ServerFailure(
          errorMessage: errorMsg,
        ),
      );
    }
  }
}
