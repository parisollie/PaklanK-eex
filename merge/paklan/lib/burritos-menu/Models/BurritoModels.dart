import 'dart:math';


double _doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;
final random = Random();

final burritos = List.generate(_names.length, (index) 
  => BurritoModels(
    name: _names[index],
    image: 'Assets/Burros/${index + 1}.png',
    price: _doubleInRange(random, 3, 7)
  )
);

class BurritoModels
{
  final String name;
  final String image;
  final double price;

  BurritoModels({
    required this.name, 
    required this.image, 
    required this.price
  });

}

final _names = [
  '1.-Burrito clasico',
  '2.-Burrito con carne',
  '3.-Burrito barbecue',
  '4.-Burrito a la Julia',
  '5.-Burrito jalapenio',
  '6.-Burrito chilli',
  '7.-Burrito gringo',
  '8.-Burrito enjamonado',
  '9.-Burrito enchorizado',
  '10.-Burrito a la Valentina',
  '11.-Burrito vegetariano',
  '12.-Burrito mexicano'
];