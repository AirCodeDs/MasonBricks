// ignore_for_file: avoid_annotating_with_dynamic

// Project imports:
import 'package:/core/utils/type_convertor/type_convertor.dart';

class ProductModel {
  ProductModel({
    required this.id,
    // Add more attributes here as needed
  });

  factory ProductModel.fromMap(dynamic json) {
    final map = TypeConvertor().convertToMapStringDynamic(json);
    return ProductModel(
      id: map['id'].toString(),
      // Add more attributes here from map
    );
  }

  final String id;
  // Add more attributes here
}