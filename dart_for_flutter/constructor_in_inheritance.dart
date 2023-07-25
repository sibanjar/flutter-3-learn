// Objectives
// 1. Inheritance with Default Constructor and Parameterised Constructor
// 2. Inheritance with Named Constructor


// Types of constructors
// 1. Factory constructors
  // - doesn't create always creates a new instance of its class.
// 2. Generative constructors -> default

void main() {

  var dog1 = Dog('Labrador', 'Black');
  var dog2 = Dog('Pug', 'Brown');

  var dog3 = Dog.myNamedConstructor('German Shepherd', 'Black-Brown');
}

class Animal {

  String color = '';

  Animal(this.color) {
    print('$color class constructor');
  }

  Animal.myAnimalNamedConstrctor(String color) {
    print('$color class named constructor');
  }
}

class Dog extends Animal {

  String breed;

  Dog(this.breed, String color) : super(color) {
    print('$breed class constructor');
  }

  Dog.myNamedConstructor(this.breed, String color) : super.myAnimalNamedConstrctor(color) {
    print('$breed class Named Constructor');
  }
}