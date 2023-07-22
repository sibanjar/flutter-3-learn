void main() {
  // use const if value is known in compile time;
  // use final if vlaue is only known in runtime;

  // final
  final cityName = 'Mumbai';
  final date = DateTime.now();
  //	name = 'Peter';     // Throws an error

  final String countryName = 'India';

  // const
  const PI = 3.14;
  const double gravity = 9.8;
 
}

class Circle {

  final String color = 'Red';
  static const PI = 3.14;
}
