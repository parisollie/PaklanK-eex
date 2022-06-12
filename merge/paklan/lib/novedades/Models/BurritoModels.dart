import 'dart:math';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
final random = Random();

final burritos = List.generate(
    _names.length,
    (index) => BurritoModels(
        name: _names[index],
        image: 'Assets/burritos/${index + 1}.png',
        price: _doubleInRange(random, 3, 7)));

class BurritoModels {
  final String name;
  final String image;
  final double price;

  BurritoModels({required this.name, required this.image, required this.price});
}

final _names = [
  '1.-AMIBA 2',
  '2.-EMP240T100C5',
  '3.-CYCLONE IV',
  '4.-DE10-LITE',
  '5.-MAX 1000',
  '6.-MAXII_EPM 240',
  '7.-CYCLONE II',
  '8.-Raspberry Pi',
];
