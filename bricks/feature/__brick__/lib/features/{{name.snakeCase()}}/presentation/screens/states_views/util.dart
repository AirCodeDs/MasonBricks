// Dart imports:
import 'dart:math';

Map<String, dynamic> generateFake{{name.pascalCase()}}() {
  final random = Random();

  final names = [
    'Alpha',
    'Beta',
    'Gamma',
    'Delta',
    'Epsilon',
  ];

  final descriptions = [
    'High-quality item.',
    'Perfect for everyday use.',
    'Designed for performance.',
    'Modern look and feel.',
    'Ergonomic and durable.',
  ];

  final name = names[random.nextInt(names.length)];
  final description = descriptions[random.nextInt(descriptions.length)];
  final price = (random.nextDouble() * 90 + 10).toStringAsFixed(2);

  return {
    'name': name,
    'description': description,
    'category': 'general',
    'price': double.parse(price),
  };
}

String capitalizeFirstLetter(String input) =>
    input.isEmpty ? input : '${input[0].toUpperCase()}${input.substring(1)}';


