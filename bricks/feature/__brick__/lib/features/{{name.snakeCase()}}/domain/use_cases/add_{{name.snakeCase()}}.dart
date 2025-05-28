// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:urban_transport/core/errors/failure.dart';
import 'package:urban_transport/core/params/params.dart';
import 'package:urban_transport/core/use_cases/use_case.dart';
import 'package:urban_transport/features/product/data/models/product_model.dart';
import 'package:urban_transport/features/product/domain/repositories/product_repository_interface.dart';

class AddProduct extends UseCase<ProductModel, AddProductParams> {
  AddProduct(this._repository);
  final ProductRepositoryInterface _repository;

  @override
  Future<Either<Failure, ProductModel>> call(
    AddProductParams addProductParams,
  ) => _repository.addProduct(addProductParams);
}

class AddProductParams extends FieldParams {
  AddProductParams({
    required String fieldParam1,
    required String fieldParam2,
    String? fieldParam3,
  }) : super(
         fieldParams: {
           'fieldParam1': fieldParam1,
           'fieldParam2': fieldParam2,
           if (fieldParam3 != null) 'fieldParam3': fieldParam3,
         },
       );
}
