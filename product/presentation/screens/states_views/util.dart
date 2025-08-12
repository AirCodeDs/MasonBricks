import 'dart:math';

Map<String, dynamic> generateFakeProduct() {
  final random = Random();

  // Sample data
  final productNames = [
    'Wireless Headphones',
    'Smart LED Lamp',
    'Portable Speaker',
    'Bluetooth Keyboard',
    'Fitness Tracker',
    'Electric Toothbrush',
    'Gaming Mouse',
    'USB-C Hub',
    'Laptop Stand',
    'Noise Earbuds',
  ];

  final descriptions = [
    'High-quality, durable, and easy to use.',
    'Perfect for home, office, or travel use.',
    'Designed for comfort and long battery life.',
    'Compatible with most devices and platforms.',
    'Sleek design with modern features.',
    'Ergonomic build with fast charging support.',
  ];

  final name = productNames[random.nextInt(productNames.length)];
  final description = descriptions[random.nextInt(descriptions.length)];
  final price =
      (random.nextDouble() * 90 + 10).toStringAsFixed(2); // $10 - $100

  return {
    'name': name,
    'description': description,
    'price': double.parse(price),
  };
}

String capitalizeFirstLetter(String input) =>
    input.isEmpty ? input : '${input[0].toUpperCase()}${input.substring(1)}';
