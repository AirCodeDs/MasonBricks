// ignore_for_file: avoid_annotating_with_dynamic

// Project imports:
import 'package:{{project_name}}/core/utils/type_convertor/type_convertor.dart';

class {{name.pascalCase()}}Model {
  {{name.pascalCase()}}Model({
    required this.id,
    // Add more attributes here as needed
  });

  factory {{name.pascalCase()}}Model.fromMap(dynamic json) {
    final map = TypeConvertor().convertToMapStringDynamic(json);
    return {{name.pascalCase()}}Model(
      id: map['id'].toString(),
      // Add more attributes here from map
    );
  }

  final String id;
  // Add more attributes here
}
