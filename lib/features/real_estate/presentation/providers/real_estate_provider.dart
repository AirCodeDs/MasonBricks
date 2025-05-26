// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/features/real_estate/data/models/real_estate_model.dart';
import 'package:/features/real_estate/data/repositories/real_estate_repository_impl.dart';
import 'package:/features/real_estate/domain/use_cases/add_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/delete_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/get_all_real_estates.dart';
import 'package:/features/real_estate/domain/use_cases/get_by_id_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/update_real_estate.dart';


part 'real_estate_provider.g.dart'; // N'oublie pas de générer ce fichier après la création !

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:/core/api_response/api_response.dart';
import 'package:/core/errors/failure.dart';
import 'package:/core/params/params.dart';
import 'package:/core/utils/models/pagination_data_model.dart';
import 'package:/features/real_estate/data/models/real_estate_model.dart';
import 'package:/features/real_estate/data/repositories/real_estate_repository_impl.dart';
import 'package:/features/real_estate/domain/use_cases/add_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/delete_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/get_all_real_estates.dart';
import 'package:/features/real_estate/domain/use_cases/get_by_id_real_estate.dart';
import 'package:/features/real_estate/domain/use_cases/update_real_estate.dart';

part 'real_estate_provider.g.dart';

// ----------- STATE MODEL -----------
class RealEstateState {
  final List<RealEstateModel> realEstates;
  final String? errorMessage;

  const RealEstateState({
    required this.realEstates,
    this.errorMessage,
  });

  RealEstateState copyWith({
    List<RealEstateModel>? realEstates,
    String? errorMessage,
  }) {
    return RealEstateState(
      realEstates: realEstates ?? this.realEstates,
      errorMessage: errorMessage,
    );
  }
}

// ----------- NOTIFIER -----------
@Riverpod(keepAlive: true)
class RealEstateNotifier extends _$RealEstateNotifier {
  late final AddRealEstate _addRealEstate;
  late final UpdateRealEstate _updateRealEstate;
  late final DeleteRealEstate _deleteRealEstate;
  late final GetAllRealEstates _getAllRealEstates;
  late final GetRealEstateById _getRealEstateById;

  PaginationDataModel<List<RealEstateModel>>? _paginationData;

  @override
  RealEstateState build() {
    final repositoryImpl = ref.read(realEstateRepositoryImplProvider);
    _addRealEstate = AddRealEstate(repositoryImpl);
    _updateRealEstate = UpdateRealEstate(repositoryImpl);
    _deleteRealEstate = DeleteRealEstate(repositoryImpl);
    _getAllRealEstates = GetAllRealEstates(repositoryImpl);
    _getRealEstateById = GetRealEstateById(repositoryImpl);
    return const RealEstateState(realEstates: []);
  }

  Future<void> fetchRealEstates({bool loadMore = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _getAllRealEstates(
      NoParams(paginationPageIndex: loadMore ? _paginationData?.getNextPageIndex() ?? 1 : 1),
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.errorMessage);
      },
      (paginationData) {
      _paginationData = paginationData;
        final newItems = [...state.realEstates, ...paginationData.child];
        state = state.copyWith(isLoading: false, realEstates: newItems);
      },
    );
  }

  Future<Either<Failure, ApiResponse>> addRealEstate(Map<String, dynamic> data) async {
    final result = await _addRealEstate(TemplateParams(params: data));
    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        fetchRealEstates();
        return Right(apiResponse);
      },
    );
  }

  Future<Either<Failure, ApiResponse>> updateRealEstate(Map<String, dynamic> data, String id) async {
    final result = await _updateRealEstate(
      TemplateParams(params: data, paramOne: ParamOne(id)),
    );

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        fetchRealEstates();
        return Right(apiResponse);
      },
    );
  }

  Future<Either<Failure, ApiResponse>> deleteRealEstate(String id) async {
    final result = await _deleteRealEstate(ParamOne(id));

    return result.fold(
      (failure) => Left(failure),
      (apiResponse) {
        final filtered = state.realEstates.where((item) => item.id != id).toList();
        state = state.copyWith(realEstates: filtered);
        return Right(apiResponse);
      },
    );
  }

  Future<Either<Failure, RealEstateModel>> getRealEstateById(String id) async {
    final cached = state.realEstates.firstWhere(
      (item) => item.id == id,
      orElse: () => throw Exception('Not found'),
    );
    if (cached != null) return Right(cached);
    final result = await _getRealEstateById(ParamOne(id));
    return result;
  }

  void clearState() {
    _paginationData = null;
    state = const RealEstateState(realEstates: []);
  }
}


@Riverpod(keepAlive: true)
RealEstateRepositoryImpl realEstateRepositoryImpl(
  realEstateRepositoryImplRef ref,
) {
  // Ici, tu injectes la source de données distante.
  // Tu auras besoin d'un provider pour ApiClient également.
  final remoteDataSource = ref.read(realEstateRemoteDataSourceProvider);
  // final localDataSource = ref.read(realEstateLocalDataSourceProvider); // Décommenter si tu as une source de données locale
  return RealEstateRepositoryImpl(remoteDataSource /* , localDataSource */);
}

// Assurez-vous que tu as aussi un provider pour ton RemoteDataSource, ex:
@Riverpod(keepAlive: true)
RealEstateRemoteDataSource realEstateRemoteDataSource(
  realEstateRemoteDataSourceRef ref,
) {
  final apiClient = ref.read(apiClientProvider); // Assurez-vous d'avoir un apiClientProvider
  return RealEstateRemoteDataSource(apiClient);
}

// Exemple pour apiClientProvider (à placer dans un fichier de services partagés)
@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(); // Ou ta logique d'instanciation de ApiClient
}