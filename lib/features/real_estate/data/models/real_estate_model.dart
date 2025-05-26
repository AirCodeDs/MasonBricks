// ignore_for_file: avoid_annotating_with_dynamic

// Project imports:
import 'package:/core/utils/type_convertor/type_convertor.dart';

class RealEstateModel {
  RealEstateModel({
    required this.id,
    // Add more attributes here as needed
  });

  factory RealEstateModel.fromMap(dynamic json) {
    final map = TypeConvertor().convertToMapStringDynamic(json);
    return RealEstateModel(
      id: map['id'].toString(),
      // Add more attributes here from map
    );
  }

  final String id;
  // Add more attributes here
}